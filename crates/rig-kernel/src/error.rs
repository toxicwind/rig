//! Kernel-specific error types.

use rig_types::error::RigError;
use thiserror::Error;

/// Kernel error type wrapping RigError with kernel-specific context.
#[derive(Error, Debug)]
pub enum KernelError {
    /// A wrapped RigError.
    #[error(transparent)]
    Rig(#[from] RigError),

    /// The kernel failed to boot.
    #[error("Boot failed: {0}")]
    BootFailed(String),
}

/// Alias for kernel results.
pub type KernelResult<T> = Result<T, KernelError>;
