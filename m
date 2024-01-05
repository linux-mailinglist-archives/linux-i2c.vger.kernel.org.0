Return-Path: <linux-i2c+bounces-1168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA06825B8D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 21:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A491F23FC7
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D2E3608B;
	Fri,  5 Jan 2024 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DhHTiZGF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6835EF7
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d4d4542526so14776835ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704486331; x=1705091131; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQ8oPZXgcLDcu5VjL3h5eohDYSKKqrE8t+ZrbBJi2Vw=;
        b=DhHTiZGFmDATJpB4Ro7sSAOK2XA5ak8AwsM/U5bGt1Obssd24BnFaXFqUoB87PBKc2
         gwTjy0Aqps3Cpva+JMtDiNVswbB1Ihh9OjeCB5xtWrXXSCtCU5KuDraiard0PLs6OLOI
         dNjMbkhnf1LRdjwY6nX3Pug7N7N4pHByt8T20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704486331; x=1705091131;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ8oPZXgcLDcu5VjL3h5eohDYSKKqrE8t+ZrbBJi2Vw=;
        b=HcuCsFnCXy0kZ+GxQ1JYMil3ywQd9ntJ01nFURv8/lG0sGCCGbEsi/IdKJUks8hTc4
         1LAleUxovf6imjbKwaq/GD1qcG7AiLOb+atooPaYHuHZLKUsU5+rJmB6pr2DnrxsKPl4
         9ndO/yvMW6eo4IypvItinA/QCFrx6QrqSfm64bSNQyO4ed2MAsRItH66aybPnBLu+Srg
         tFAWuM8xlXXUoiUYFGWtzGdxdP/+vpaCqLxC875v7zVIk8oOtzoxJwWvlwNua1HPiaEc
         fCFuqywGxqfIH5EtsACNmo2XH96sBJ+TxROlmamXBPlXukDABeTNdV7OtCkvpxAxZ5ON
         /WeQ==
X-Gm-Message-State: AOJu0YxK2WQdvPL0BDTAI+W1zOtXAkt73+AXLnuEhKTA4wn9+td0NU5R
	Zt32Q3oCyCSLW5dgUJ7Wg4USjYM/UGg=
X-Google-Smtp-Source: AGHT+IGhPwIiDEmFHW5bW2HUPeNMzGPssGNjpY4I5zvuPSrsvHDB4xzwxdEICXBfOaedUCtFiugqVQ==
X-Received: by 2002:a17:902:6e08:b0:1d0:6ffd:e2b8 with SMTP id u8-20020a1709026e0800b001d06ffde2b8mr7223plk.82.1704486331103;
        Fri, 05 Jan 2024 12:25:31 -0800 (PST)
Received: from chromium.org ([2620:15c:11a:202:1a1:c8f2:6bc6:18fe])
        by smtp.gmail.com with ESMTPSA id bf8-20020a170902b90800b001cff353696asm1782532plb.302.2024.01.05.12.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 12:25:30 -0800 (PST)
Date: Fri, 5 Jan 2024 12:25:22 -0800
From: Matthew Blecker <matthewb@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v1] i2c: new i2c-pseudo driver for userspace i2c adapters
Message-ID: <ZZhlsikbGSWNxmxs@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The i2c-pseudo module provides /dev/i2c-pseudo for implementing
I2C adapters in userspace.

I2C adapter functionality supported:
* I2C_FUNC_I2C
* I2C_FUNC_10BIT_ADDR
* I2C_FUNC_PROTOCOL_MANGLING
* I2C_FUNC_SMBUS_EMUL

The UAPI is based around ioctl commands. Each open /dev/i2c-pseudo fd
has its own independent state and I2C adapter device. For further detail
see the documentation and UAPI header:
* Documentation/i2c/i2c-pseudo.rst
* include/uapi/linux/i2c-pseudo.h
* Of note, the new UAPI structs use actual pointer types, not __u64,
  because they're built around the existing i2c_msg with its __u8 * buf.

In the ChromeOS ecosystem i2c-pseudo is used for controlling I2C on
devices under test (DUTs). A userspace program speaks the varying and
evolving I2C controller interfaces provided by many types of I2C capable
debug hardware, typically controlled over USB, or sometimes serial UART.
That userspace program now uses /dev/i2c-pseudo, when present, to
provide Linux I2C adapters for each I2C bus under its control.

These debug hardware I2C controller interfaces are better suited to
userspace than kernel implementations, however it is useful to have
/dev/i2c-<N> as a standard interface. This allows any software written
for i2c-dev to simply work as-is with these userspace I2C controllers,
and avoids having an alternate API for software that must support the
debug hardware.

Examples where i2c-dev backed by i2c-pseudo is used:
* Writing or reading the firmware of certain microcontrollers, where
  this is done over I2C.
* i2c-tools e.g. i2ctransfer(8) for convenient interactive probing and
  mutating of I2C targets on the DUTs.

This driver can also be used to mock the behavior of I2C targets, for
regression testing Linux drivers and software that control I2C devices.
While i2c-stub exists for that purpose now, it is limited by design.
This can emulate most possible behavior from an I2C target and
adapter driver, including changing responses and failures.

Signed-off-by: Matthew Blecker <matthewb@chromium.org>

---

This patch proposes a new UAPI, and I recognize that is no small ask.
Please let me know if you are open to userspace I2C adapters, even if
this specific UAPI or its implementation may have issues.

---

Historical note:

In May 2020 I sent an earlier implementation of an I2C adapter UAPI
which also used the i2c-pseudo driver name.

https://lore.kernel.org/r/20200521002907.176922-1-matthewb@chromium.org/

This patch is a completely new implementation with a new UAPI. This
ioctl-based UAPI is more typical for Linux and results in a much simpler
driver implementation. This is also more aligned with the i2c-dev UAPI.

I think this patch is best considered as a new clean slate proposal, it
does not make sense as diff from that old one. Hence "v1" with a subtly
changed title.

---

Other notes:

* This v1 patch does not provide compat_ioctl. The pointer types make it
  non-trivial. CrOS have no use case for 32-bit compat mode with this
  driver, and it's unclear to me that anyone else would in 2024+.
  If compat_ioctl is still mandatory to support, or anyone reading this
  would find it useful with this specific driver, please let me know and
  I'll update the patch with it.

* Most usage to date has been as an out-of-tree module on x86_64
  ChromeOS developer systems, compiled and installed separately from the
  main kernel. The most common use is the MCU firmware flashing
  mentioned above, where 512 KiB firmware images are sent or read as
  fast as the underlying I2C bus and MCU storage allows. i2c-pseudo has
  been reliable and not a bottleneck for this.

* I have stress tested having a userspace controller run many threads
  attempting epoll_wait(), I2CP_IOCTL_XFER_REQ, or I2CP_IOCTL_XFER_REPLY
  in parallel with a shared pseudo adapter. Parallel I/O threads with
  I2C is pointless of course, but should be handled gracefully.

---
 .../ABI/testing/sysfs-devices-i2c-pseudo      |  11 +
 Documentation/i2c/i2c-pseudo.rst              | 225 +++++
 Documentation/i2c/index.rst                   |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 drivers/i2c/Kconfig                           |  11 +
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-pseudo.c                      | 864 ++++++++++++++++++
 include/uapi/linux/i2c-pseudo.h               | 259 ++++++
 samples/i2c-pseudo/.gitignore                 |   2 +
 samples/i2c-pseudo/Makefile                   |  12 +
 samples/i2c-pseudo/i2c-adapter-example.c      | 160 ++++
 11 files changed, 1548 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-i2c-pseudo
 create mode 100644 Documentation/i2c/i2c-pseudo.rst
 create mode 100644 drivers/i2c/i2c-pseudo.c
 create mode 100644 include/uapi/linux/i2c-pseudo.h
 create mode 100644 samples/i2c-pseudo/.gitignore
 create mode 100644 samples/i2c-pseudo/Makefile
 create mode 100644 samples/i2c-pseudo/i2c-adapter-example.c

diff --git a/Documentation/ABI/testing/sysfs-devices-i2c-pseudo b/Documentation/ABI/testing/sysfs-devices-i2c-pseudo
new file mode 100644
index 000000000000..9b6dfd066384
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-i2c-pseudo
@@ -0,0 +1,11 @@
+What:	/sys/devices/virtual/i2c-pseudo/.../open_count
+Date:	November 2023
+Contact:	Matthew Blecker <matthewb@chromium.org>
+Description:
+	The number of open file handles for the i2c-pseudo device.
+
+	This shows utilization of a resource whose limit is set by
+	i2c-pseudo module max_adapters parameter.
+
+	This may be greater than the number of extant pseudo adapters
+	because an adapter is only created after a specific ioctl call.
diff --git a/Documentation/i2c/i2c-pseudo.rst b/Documentation/i2c/i2c-pseudo.rst
new file mode 100644
index 000000000000..511dd8ad6795
--- /dev/null
+++ b/Documentation/i2c/i2c-pseudo.rst
@@ -0,0 +1,225 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Implementing I2C adapters in userspace
+======================================
+
+The ``i2c-pseudo`` module provides ``/dev/i2c-pseudo`` for implementing
+I2C adapters in userspace.
+
+Use cases for userspace I2C adapters include:
+
+- Using standard Linux I2C interfaces, particularly ``/dev/i2c-%d`` from
+  ``i2c-dev`` module, to control I2C on remote systems under test managed by
+  userspace software.
+
+- Mocking the behavior of I2C devices for regression testing Linux drivers and
+  software that use I2C.
+
+Supported I2C adapter functionality:
+
+- ``I2C_FUNC_I2C``
+- ``I2C_FUNC_10BIT_ADDR``
+- ``I2C_FUNC_PROTOCOL_MANGLING``
+- ``I2C_FUNC_SMBUS_EMUL``
+
+Native SMBUS is not currently supported, only SMBUS emulation. The UAPI could be
+extended with new commands to support native SMBUS in the future.
+
+
+Basic usage
+===========
+
+The UAPI is based around ioctl() commands. Each open ``/dev/i2c-pseudo``
+file descriptor has its own independent state and I2C adapter device.
+
+Open ``/dev/i2c-pseudo`` and call ioctl ``I2CP_IOCTL_START`` to create a new
+I2C adapter on the system. The adapter will live until its file descriptor is
+closed. Multiple pseudo adapters can co-exist simultaneously, controlled by the
+same or different userspace processes.
+
+When an I2C device driver sends an I2C transfer request to a pseudo adapter, the
+transfer becomes available via ioctl ``I2CP_IOCTL_XFER_REQ``. Issue a reply
+via ioctl ``I2CP_IOCTL_XFER_REPLY`` before the adapter timeout expires and the
+reply will be sent back to the I2C device driver. Polling and non-blocking modes
+are supported.
+
+
+ioctl() commands
+================
+
+This is a short summary of each ioctl command. See
+``include/uapi/linux/i2c-pseudo.h`` for a detailed description of arguments,
+usage, and behavior.
+
+For all commands, any non-negative return value indicates success, and any
+negative return value indicates an error with ``errno`` set.
+
+``I2CP_IOCTL_START``
+
+  Set I2C adapter attributes and start the adapter.
+
+``I2CP_IOCTL_XFER_REQ``
+
+  Get an I2C transfer request.
+
+  If there is no transfer waiting to be requested this will block indefinitely
+  for the next one, unless ``O_NONBLOCK`` is set, in which case this will fail
+  with ``EWOULDBLOCK`` or ``EAGAIN``.
+
+  This will never *successfully* return the same transfer more than once.
+  Certain errors may be corrected and retried before the pending transfer times
+  out.
+
+``I2CP_IOCTL_XFER_REPLY``
+
+  Reply to an I2C transfer request.
+
+  The reply indicates success or failure, as well as the number of I2C messages
+  that were transferred out of the total requested.
+
+  All I2C reads that the reply says were transferred must have their buffers
+  filled with the requested data, regardless of whether the reply indicates
+  overall success or failure.
+
+  This will never successfully return for the same I2C transfer more than once.
+
+``I2CP_IOCTL_GET_COUNTERS``
+
+  Get transfer counters, including transfers which failed from timeout or
+  other reasons before userspace requested or replied to them.
+
+  This provides visibility into problems keeping up with transfer requests.
+
+  Note that a successful ``I2CP_IOCTL_XFER_REPLY`` is always a success from the
+  perspective of these counters, even if the reply indicated a failure.
+  Userspace can track its own failure reasons without kernel assistance,
+  and likely with more detail than just the error code provided to the kernel.
+
+``I2CP_IOCTL_SHUTDOWN``
+
+  Permanently unblock all userspace I/O and refuse further I2C transfers.
+
+  ``I2CP_IOCTL_XFER_REQ``, ``I2CP_IOCTL_XFER_REPLY``, and I2C transfers will
+  fail with ``ESHUTDOWN``, and polling will indicate ``POLLHUP``.
+
+  This does not remove the actual I2C adapter device, that only happens when the
+  file descriptor is closed.
+
+  Use of this is *optional* for userspace convenience to unblock other threads
+  or processes before closing the fd, to avoid undefined or undesirable behavior
+  around closing an fd when other threads may be blocked on it. Programs may of
+  course avoid that using other means of synchronization, or by virtue of being
+  single-threaded.
+
+
+Blocking and non-blocking modes
+===============================
+
+Blocking mode is the default. Set ``O_NONBLOCK`` for non-blocking mode.
+
+In blocking mode ``I2CP_IOCTL_XFER_REQ`` will wait indefinitely for a new
+I2C transfer request if there is not one waiting to be requested. It can be
+interrupted by a signal or ``I2CP_IOCTL_SHUTDOWN``. It may restart automatically
+after a signal handler that was established with ``SA_RESTART``.
+
+In non-blocking mode ``I2CP_IOCTL_XFER_REQ`` will fail with
+``EWOULDBLOCK`` or ``EAGAIN`` if no transfer is waiting to be requested.
+
+Other commands never wait indefinitely for transfer requests and are unaffected
+by ``O_NONBLOCK``.
+
+
+Polling
+=======
+
+Polling is supported, in blocking or non-blocking mode.
+
+``POLLIN``
+
+  An I2C transfer is available for ``I2CP_IOCTL_XFER_REQ``.
+
+``POLLOUT``
+
+  An I2C transfer is waiting for ``I2CP_IOCTL_XFER_REPLY``.
+
+  This is always the case immediately after successful ``I2CP_IOCTL_XFER_REQ``,
+  so polling for this is unnecessary, it is safe and recommended to call
+  ``I2CP_IOCTL_XFER_REPLY`` as soon as a reply is ready.
+
+``POLLHUP``
+
+  ``I2CP_IOCTL_SHUTDOWN`` has been called.
+
+While polling is fully functional in blocking mode, polling cannot be used to
+avoid blocking. If a pending I2C transaction request times out between receiving
+``POLLIN`` and issuing ``I2CP_IOCTL_XFER_REQ``, the latter will wait for the
+next transfer request unless ``O_NONBLOCK`` is set.
+
+
+Example userspace I2C adapter
+=============================
+
+See ``samples/i2c-pseudo/i2c-adapter-example.c`` for a simple program that
+starts an I2C adapter and prints the I2C transfers it receives, with I2C reads
+filled by reading from ``stdin``.
+
+Sample usage:
+
+::
+
+	$ sudo modprobe i2c-pseudo
+	$ cd samples/i2c-pseudo
+	$ make i2c-adapter-example
+	$ ./i2c-adapter-example < /dev/urandom
+	adapter_num=13
+
+Use a different terminal to issue I2C transfers to its I2C adapter number:
+
+::
+
+	$ sudo modprobe i2c-dev
+	$ i2ctransfer -y 13 w2@0x20 0x03 0x5a w3@0x77 0x2b+
+	$ i2ctransfer -y 13 w2@0x20 0x03 0x5a r5@0x75
+	$ i2ctransfer -y 13 w5@0x70 0xc2 0xff=
+	$ i2ctransfer -y 13 w3@0x1e 0x1a+ r2 r2
+
+With the data read from ``/dev/urandom`` the full exchange might look like this
+on the ``i2c-transfer`` side:
+
+::
+
+	$ i2ctransfer -y 13 w2@0x20 0x03 0x5a w3@0x77 0x2b+
+	$ i2ctransfer -y 13 w2@0x20 0x03 0x5a r5@0x75
+	0x7f 0x3c 0xf1 0x30 0x46
+	$ i2ctransfer -y 13 w5@0x70 0xc2 0xff=
+	$ i2ctransfer -y 13 w3@0x1e 0x1a+ r2 r2
+	0x3e 0xe4
+	0x58 0xe9
+
+And like this on the ``i2c-adapter-example`` side:
+
+::
+
+	$ ./i2c-adapter-example < /dev/urandom
+	adapter_num=13
+
+	begin transaction
+	addr=0x20 flags=0x200 len=2 write=[0x03 0x5a]
+	addr=0x77 flags=0x200 len=3 write=[0x2b 0x2c 0x2d]
+	end transaction
+
+	begin transaction
+	addr=0x20 flags=0x200 len=2 write=[0x03 0x5a]
+	addr=0x75 flags=0x201 len=5 read=[0x7f 0x3c 0xf1 0x30 0x46]
+	end transaction
+
+	begin transaction
+	addr=0x70 flags=0x200 len=5 write=[0xc2 0xff 0xff 0xff 0xff]
+	end transaction
+
+	begin transaction
+	addr=0x1e flags=0x200 len=3 write=[0x1a 0x1b 0x1c]
+	addr=0x1e flags=0x201 len=2 read=[0x3e 0xe4]
+	addr=0x1e flags=0x201 len=2 read=[0x58 0xe9]
+	end transaction
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 2b213d4ce89c..31800ef2c410 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -58,6 +58,7 @@ Advanced topics
    :maxdepth: 1
 
    ten-bit-addresses
+   i2c-pseudo
 
 Legacy documentation
 ====================
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 4ea5b837399a..c15e729a8b24 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -88,6 +88,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <http://infiniband.sourceforge.net/>
 0x20  all    drivers/cdrom/cm206.h
 0x22  all    scsi/sg.h
+0x2C  00-04  uapi/linux/i2c-pseudo.h                                 userspace I2C controllers
+0x2C  05-31  uapi/linux/i2c-pseudo.h                                 reserved for future use (e.g. SMBUS UAPI)
 0x3E  00-0F  linux/counter.h                                         <mailto:linux-iio@vger.kernel.org>
 '!'   00-1F  uapi/linux/seccomp.h
 '#'   00-3F                                                          IEEE 1394 Subsystem
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 9388823bb0bb..7ce7fd4baec0 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -107,6 +107,17 @@ config I2C_SMBUS
 source "drivers/i2c/algos/Kconfig"
 source "drivers/i2c/busses/Kconfig"
 
+config I2C_PSEUDO
+	tristate "I2C userspace adapter interface"
+	help
+	  Say Y here to have an i2c-pseudo device file, usually found in
+	  the /dev directory on your system.  This makes it possible to
+	  have user-space programs implement an I2C adapter.
+	  Information on how to do this is contained in
+	  <file:Documentation/i2c/i2c-pseudo.rst>.
+
+	  This support is also available as a module, called i2c-pseudo.
+
 config I2C_STUB
 	tristate "I2C/SMBus Test Stub"
 	depends on m
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..799141f1e9fb 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
 obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
 obj-$(CONFIG_I2C_ATR)		+= i2c-atr.o
 obj-y				+= algos/ busses/ muxes/
+obj-$(CONFIG_I2C_PSEUDO)	+= i2c-pseudo.o
 obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
 obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
 obj-$(CONFIG_I2C_SLAVE_TESTUNIT)	+= i2c-slave-testunit.o
diff --git a/drivers/i2c/i2c-pseudo.c b/drivers/i2c/i2c-pseudo.c
new file mode 100644
index 000000000000..65e2b028b909
--- /dev/null
+++ b/drivers/i2c/i2c-pseudo.c
@@ -0,0 +1,864 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * i2c-pseudo.c - userspace I2C adapters
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This allows for userspace implementations of functionality such as tunneling
+ * I2C through another communication channel, or mocking of real I2C devices for
+ * driver tests.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/cdev.h>
+#include <linux/compiler.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/time64.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/wait.h>
+#include <uapi/linux/i2c-pseudo.h>
+
+/* Use u32_max for params that limit or correspond to u32 UAPI fields. */
+static int param_set_u32_max(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, 0, U32_MAX);
+}
+static const struct kernel_param_ops param_ops_u32_max = {
+	.set = param_set_u32_max,
+	.get = param_get_uint,
+};
+#define param_check_u32_max(name, p) __param_check(name, p, unsigned int)
+
+static unsigned int max_adapters = 1 << 7;
+module_param(max_adapters, uint, 0444);
+MODULE_PARM_DESC(max_adapters, "Maximum number of concurrent userspace I2C adapters");
+
+static unsigned int max_msgs_per_xfer = 1 << 7;
+module_param(max_msgs_per_xfer, u32_max, 0444);
+MODULE_PARM_DESC(max_msgs_per_xfer, "Maximum number of I2C messages per master_xfer transaction");
+
+static unsigned int max_total_data_per_xfer = 1 << 15;
+module_param(max_total_data_per_xfer, u32_max, 0444);
+MODULE_PARM_DESC(max_total_data_per_xfer, "Maximum total size of all buffers per master_xfer transaction");
+
+static unsigned int default_timeout_ms = 3 * MSEC_PER_SEC;
+module_param(default_timeout_ms, u32_max, 0444);
+MODULE_PARM_DESC(default_timeout_ms, "Default I2C transaction timeout, in milliseconds. 0 for subsystem default");
+
+static unsigned int max_timeout_ms = 10 * MSEC_PER_SEC;
+module_param(max_timeout_ms, u32_max, 0444);
+MODULE_PARM_DESC(max_timeout_ms, "Maximum I2C transaction timeout, in milliseconds");
+
+static struct class *i2cp_class;
+static dev_t i2cp_cdev_num;
+static const unsigned int i2cp_cdev_count = 1;
+
+struct i2cp_device {
+	struct cdev cdev;
+	struct device device;
+
+	/* must hold to access count_* fields */
+	struct mutex count_lock;
+	unsigned int count_open;
+};
+
+static struct i2cp_device *i2cp_device;
+
+/*
+ * All values must be >= 0. This should not contain any error values.
+ *
+ * The state for a new controller must have a zero value, so that
+ * zero-initialized memory results in the correct default value.
+ */
+enum i2cp_state {
+	I2CP_STATE_NEW = 0,
+	I2CP_STATE_WAIT_FOR_XFER,
+	I2CP_STATE_WAIT_FOR_REQ,
+	I2CP_STATE_WAIT_FOR_REPLY,
+	I2CP_STATE_XFER_RETURN,
+	I2CP_STATE_RETURN_THEN_SHUTDOWN,
+	I2CP_STATE_SHUTDOWN,
+};
+
+struct i2cp_controller {
+	u32 functionality;
+	struct i2c_adapter i2c_adapter;
+	/* wake for any change to xfer_state */
+	wait_queue_head_t state_wait_queue;
+	/* wake for any change to I/O readiness */
+	wait_queue_head_t poll_wait_queue;
+
+	/* must hold to access xfer_* fields, except READ_ONCE(xfer_state) */
+	struct mutex xfer_lock;
+	/*
+	 * must hold xfer_lock while writing AND use WRITE_ONCE()
+	 * must hold xfer_lock while reading OR use READ_ONCE()
+	 */
+	enum i2cp_state xfer_state;
+	struct i2cp_ioctl_xfer_counters xfer_counters;
+	u64 xfer_id;
+	struct i2c_msg *xfer_msgs;
+	u32 xfer_num_msgs;
+	int xfer_ret;
+};
+
+static bool i2cp_sum_buf_lens(const struct i2c_msg *msgs, size_t num_msgs,
+			      size_t *ret)
+{
+	for (size_t i = 0; i < num_msgs; ++i)
+		if (check_add_overflow(msgs[i].len, *ret, ret))
+			return false;
+	return (*ret <= max_total_data_per_xfer);
+}
+
+static inline bool i2cp_check_buf_lens(const struct i2c_msg *msgs,
+				       size_t num_msgs)
+{
+	size_t total_buf_len;
+
+	return i2cp_sum_buf_lens(msgs, num_msgs, &total_buf_len);
+}
+
+static inline bool i2cp_master_xfer_wait_cond(enum i2cp_state xfer_state)
+{
+	return xfer_state != I2CP_STATE_WAIT_FOR_REQ &&
+	       xfer_state != I2CP_STATE_WAIT_FOR_REPLY;
+}
+
+static int i2cp_adapter_master_xfer(struct i2c_adapter *adap,
+				    struct i2c_msg *msgs, int num)
+{
+	int ret = -ENOTRECOVERABLE;
+	long time_left;
+	struct i2cp_controller *pdata;
+
+	pdata = adap->algo_data;
+	mutex_lock(&pdata->xfer_lock);
+	if (unlikely(num < 0)) {
+		pdata->xfer_counters.unknown_failure++;
+		ret = -EINVAL;
+		goto unlock;
+	}
+	if ((unsigned int)num > max_msgs_per_xfer) {
+		pdata->xfer_counters.too_many_msgs++;
+		ret = -EMSGSIZE;
+		goto unlock;
+	}
+
+	switch (pdata->xfer_state) {
+	case I2CP_STATE_WAIT_FOR_XFER:
+		break;
+	case I2CP_STATE_SHUTDOWN:
+		pdata->xfer_counters.after_shutdown++;
+		ret = -ESHUTDOWN;
+		goto unlock;
+	default:
+		pdata->xfer_counters.unknown_failure++;
+		goto unlock;
+	}
+
+	if (!i2cp_check_buf_lens(msgs, num)) {
+		pdata->xfer_counters.too_much_data++;
+		ret = -ENOBUFS;
+		goto unlock;
+	}
+
+	pdata->xfer_id++;
+	pdata->xfer_msgs = msgs;
+	pdata->xfer_num_msgs = num;
+	pdata->xfer_ret = 0;
+	WRITE_ONCE(pdata->xfer_state, I2CP_STATE_WAIT_FOR_REQ);
+	mutex_unlock(&pdata->xfer_lock);
+
+	wake_up_interruptible_sync(&pdata->state_wait_queue);
+	wake_up_interruptible_sync_poll(&pdata->poll_wait_queue, EPOLLIN);
+	time_left = wait_event_interruptible_timeout(
+		pdata->state_wait_queue,
+		i2cp_master_xfer_wait_cond(READ_ONCE(pdata->xfer_state)),
+		adap->timeout);
+
+	mutex_lock(&pdata->xfer_lock);
+	switch (pdata->xfer_state) {
+	case I2CP_STATE_XFER_RETURN:
+		WRITE_ONCE(pdata->xfer_state, I2CP_STATE_WAIT_FOR_XFER);
+		pdata->xfer_counters.controller_replied++;
+		ret = pdata->xfer_ret;
+		goto unlock;
+	case I2CP_STATE_RETURN_THEN_SHUTDOWN:
+		WRITE_ONCE(pdata->xfer_state, I2CP_STATE_SHUTDOWN);
+		pdata->xfer_counters.controller_replied++;
+		ret = pdata->xfer_ret;
+		goto unlock;
+	case I2CP_STATE_WAIT_FOR_REQ:
+		if (time_left == 0)
+			pdata->xfer_counters.timed_out_before_req++;
+		else
+			pdata->xfer_counters.interrupted_before_req++;
+		break;
+	case I2CP_STATE_WAIT_FOR_REPLY:
+		if (time_left == 0)
+			pdata->xfer_counters.timed_out_before_reply++;
+		else
+			pdata->xfer_counters.interrupted_before_reply++;
+		break;
+	case I2CP_STATE_SHUTDOWN:
+		pdata->xfer_counters.after_shutdown++;
+		ret = -ESHUTDOWN;
+		goto unlock;
+	default:
+		pdata->xfer_counters.unknown_failure++;
+		goto unlock;
+	}
+
+	WRITE_ONCE(pdata->xfer_state, I2CP_STATE_WAIT_FOR_XFER);
+	if (time_left == 0)
+		ret = -ETIMEDOUT;
+	else if (time_left == -ERESTARTSYS)
+		ret = -EINTR;
+
+unlock:
+	mutex_unlock(&pdata->xfer_lock);
+	return ret;
+}
+
+static u32 i2cp_adapter_functionality(struct i2c_adapter *adap)
+{
+	return container_of(adap, struct i2cp_controller, i2c_adapter)
+		->functionality;
+}
+
+static const struct i2c_algorithm i2cp_algorithm = {
+	.master_xfer = i2cp_adapter_master_xfer,
+	.functionality = i2cp_adapter_functionality,
+};
+
+static int i2cp_cdev_open(struct inode *inodep, struct file *filep)
+{
+	struct i2cp_controller *pdata;
+	struct i2cp_device *i2cp_dev;
+
+	i2cp_dev = container_of(inodep->i_cdev, struct i2cp_device, cdev);
+
+	mutex_lock(&i2cp_dev->count_lock);
+	if (i2cp_dev->count_open >= max_adapters) {
+		mutex_unlock(&i2cp_dev->count_lock);
+		return -ENOSPC;
+	}
+	/* I2C pseudo adapter controllers are not seekable. */
+	stream_open(inodep, filep);
+	/* Refuse fsnotify events. Modeled after /dev/ptmx implementation. */
+	filep->f_mode |= FMODE_NONOTIFY;
+	/* Allocate the I2C adapter. */
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata) {
+		mutex_unlock(&i2cp_dev->count_lock);
+		return -ENOMEM;
+	}
+	i2cp_dev->count_open++;
+	mutex_unlock(&i2cp_dev->count_lock);
+
+	init_waitqueue_head(&pdata->state_wait_queue);
+	init_waitqueue_head(&pdata->poll_wait_queue);
+	mutex_init(&pdata->xfer_lock);
+
+	/* Initialize the I2C adapter. */
+	pdata->i2c_adapter.owner = THIS_MODULE;
+	pdata->i2c_adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	pdata->i2c_adapter.algo = &i2cp_algorithm;
+	pdata->i2c_adapter.algo_data = pdata;
+	pdata->i2c_adapter.dev.parent = &i2cp_dev->device;
+	filep->private_data = pdata;
+	return 0;
+}
+
+static int i2cp_cdev_release(struct inode *inodep, struct file *filep)
+{
+	bool adapter_was_added = false;
+	struct i2cp_controller *pdata;
+	struct i2cp_device *i2cp_dev;
+
+	pdata = filep->private_data;
+	i2cp_dev = container_of(inodep->i_cdev, struct i2cp_device, cdev);
+
+	mutex_lock(&pdata->xfer_lock);
+	filep->private_data = NULL;
+	if (pdata->xfer_state != I2CP_STATE_NEW) {
+		/*
+		 * Defer deleting the adapter until after releasing
+		 * pdata->xfer_state. This avoids deadlocking with any
+		 * overlapping i2cp_adapter_master_xfer() calls, which also
+		 * acquire the lock in order to check the state.
+		 */
+		adapter_was_added = true;
+		WRITE_ONCE(pdata->xfer_state,
+			   (pdata->xfer_state == I2CP_STATE_XFER_RETURN) ?
+				   I2CP_STATE_RETURN_THEN_SHUTDOWN :
+				   I2CP_STATE_SHUTDOWN);
+	}
+	mutex_unlock(&pdata->xfer_lock);
+
+	wake_up_all(&pdata->state_wait_queue);
+	wake_up_all(&pdata->poll_wait_queue);
+
+	if (adapter_was_added)
+		i2c_del_adapter(&pdata->i2c_adapter);
+
+	mutex_lock(&i2cp_dev->count_lock);
+	i2cp_dev->count_open--;
+	mutex_unlock(&i2cp_dev->count_lock);
+
+	kfree(pdata);
+	return 0;
+}
+
+static inline long i2cp_set_functionality(u32 functionality,
+					  struct i2cp_controller *pdata)
+{
+	if ((functionality & I2C_FUNC_I2C) != I2C_FUNC_I2C ||
+	    (functionality &
+	     ~(I2C_FUNC_I2C |
+	       I2C_FUNC_10BIT_ADDR |
+	       I2C_FUNC_PROTOCOL_MANGLING |
+	       I2C_FUNC_SMBUS_EMUL)))
+		return -EINVAL;
+	pdata->functionality = functionality;
+	return 0;
+}
+
+static inline long i2cp_set_timeout(u32 timeout_ms,
+				    struct i2cp_controller *pdata)
+{
+	if (!timeout_ms)
+		timeout_ms = default_timeout_ms;
+	if (timeout_ms > max_timeout_ms)
+		return -EINVAL;
+	pdata->i2c_adapter.timeout = msecs_to_jiffies(timeout_ms);
+	return 0;
+}
+
+static inline long i2cp_set_name(const char __user *name,
+				 struct i2cp_controller *pdata)
+{
+	long ret;
+
+	if (!name)
+		return -EINVAL;
+	ret = strncpy_from_user(pdata->i2c_adapter.name, name,
+				sizeof(pdata->i2c_adapter.name) - 1);
+	pdata->i2c_adapter.name[sizeof(pdata->i2c_adapter.name) - 1] = '\0';
+	return ret;
+}
+
+static long i2cp_cdev_ioctl_start(struct file *filep, unsigned long arg)
+{
+	long ret;
+	struct i2cp_ioctl_start_arg __user *user_arg;
+	struct i2cp_ioctl_start_arg arg_copy;
+	struct i2cp_controller *pdata;
+
+	pdata = filep->private_data;
+	mutex_lock(&pdata->xfer_lock);
+	if (pdata->xfer_state != I2CP_STATE_NEW) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	user_arg = (void __user *)arg;
+	if (copy_from_user(&arg_copy, user_arg, sizeof(arg_copy))) {
+		ret = -EFAULT;
+		goto unlock;
+	}
+
+	ret = i2cp_set_functionality(arg_copy.functionality, pdata);
+	if (ret < 0)
+		goto unlock;
+	ret = i2cp_set_timeout(arg_copy.timeout_ms, pdata);
+	if (ret < 0)
+		goto unlock;
+	ret = i2cp_set_name(arg_copy.name, pdata);
+	if (ret < 0)
+		goto unlock;
+	arg_copy.output.name_len = ret;
+
+	ret = i2c_add_adapter(&pdata->i2c_adapter);
+	if (ret < 0)
+		goto unlock;
+	BUILD_BUG_ON(INT_MAX > U64_MAX);
+	arg_copy.output.adapter_num = pdata->i2c_adapter.nr;
+
+	BUILD_BUG_ON((void *)&arg_copy.output != (void *)&arg_copy);
+	if (copy_to_user(user_arg, &arg_copy.output, sizeof(arg_copy.output))) {
+		ret = -EFAULT;
+		i2c_del_adapter(&pdata->i2c_adapter);
+		goto unlock;
+	}
+
+	ret = 0;
+	WRITE_ONCE(pdata->xfer_state, I2CP_STATE_WAIT_FOR_XFER);
+
+unlock:
+	mutex_unlock(&pdata->xfer_lock);
+	return ret;
+}
+
+static void i2cp_null_bufs(struct i2c_msg *msgs, u32 num_msgs)
+{
+	for (u32 i = 0; i < num_msgs; ++i)
+		msgs[i].buf = NULL;
+}
+
+static void i2cp_fill_bufs(struct i2c_msg *msgs, u32 num_msgs,
+			   u8 *data_buf_copy, u8 __user *user_data_buf)
+{
+	u32 i;
+	size_t pos;
+
+	for (i = 0, pos = 0; i < num_msgs; pos += msgs[i++].len) {
+		/*
+		 * The data buffer is always copied, even for reads, to
+		 * faithfully pass on to userspace exactly what this I2C adapter
+		 * received from the I2C subsystem.
+		 */
+		memcpy(&data_buf_copy[pos], msgs[i].buf,
+		       sizeof(*msgs[i].buf) * msgs[i].len);
+		/* Set buf address for userspace. */
+		msgs[i].buf = &user_data_buf[pos];
+	}
+}
+
+/* Returns true if *msgs_copy should be copied to user, false if not. */
+/* When false is returned, *ret _will_ be set to a negative errno value. */
+/* When true is returned, *ret _may_ be set to a negative errno value. */
+static bool i2cp_xfer_req_copy_data(struct i2c_msg *msgs_copy, u32 num_msgs,
+				    u8 __user *user_data_buf, u32 data_buf_len,
+				    long *ret)
+{
+	bool copy_msgs = true;
+	size_t total_buf_len;
+	u8 *data_buf_copy;
+
+	if (!i2cp_sum_buf_lens(msgs_copy, num_msgs, &total_buf_len) ||
+	    total_buf_len > data_buf_len) {
+		i2cp_null_bufs(msgs_copy, num_msgs);
+		*ret = -ENOBUFS;
+		return true;
+	}
+
+	data_buf_copy = kzalloc(sizeof(*data_buf_copy) * total_buf_len,
+				GFP_KERNEL);
+	if (!data_buf_copy) {
+		*ret = -ENOMEM;
+		return false;
+	}
+
+	i2cp_fill_bufs(msgs_copy, num_msgs, data_buf_copy, user_data_buf);
+	if (copy_to_user(user_data_buf, data_buf_copy,
+			 sizeof(*data_buf_copy) * total_buf_len)) {
+		*ret = -EFAULT;
+		copy_msgs = false;
+	}
+	kfree(data_buf_copy);
+	return copy_msgs;
+}
+
+static long i2cp_xfer_req_copy_msgs(struct i2c_msg *xfer_msgs, u32 num_msgs,
+				    struct i2cp_ioctl_xfer_req_arg *arg_copy)
+{
+	long ret = 0;
+	struct i2c_msg *msgs_copy;
+
+	msgs_copy = kmemdup(xfer_msgs, sizeof(*xfer_msgs) * num_msgs,
+			    GFP_KERNEL);
+	if (!msgs_copy)
+		return -ENOMEM;
+	if (i2cp_xfer_req_copy_data(msgs_copy, num_msgs, arg_copy->data_buf,
+				    arg_copy->data_buf_len, &ret) &&
+	    copy_to_user(arg_copy->msgs, msgs_copy,
+			 sizeof(*msgs_copy) * num_msgs))
+		ret = -EFAULT;
+	kfree(msgs_copy);
+	return ret;
+}
+
+static inline bool i2cp_xfer_req_wait_cond(enum i2cp_state xfer_state)
+{
+	return xfer_state != I2CP_STATE_WAIT_FOR_XFER &&
+	       xfer_state != I2CP_STATE_WAIT_FOR_REPLY &&
+	       xfer_state != I2CP_STATE_XFER_RETURN;
+}
+
+static long i2cp_cdev_ioctl_xfer_req(struct file *filep, unsigned long arg)
+{
+	long ret = 0;
+	struct i2cp_ioctl_xfer_req_arg arg_copy;
+	struct i2cp_ioctl_xfer_req_arg __user *user_arg;
+	struct i2cp_controller *pdata;
+
+	pdata = filep->private_data;
+	user_arg = (void __user *)arg;
+	if (copy_from_user(&arg_copy, user_arg, sizeof(arg_copy)))
+		return -EFAULT;
+
+check_xfer_state:
+	mutex_lock(&pdata->xfer_lock);
+	switch (pdata->xfer_state) {
+	case I2CP_STATE_WAIT_FOR_REQ:
+		break;
+	case I2CP_STATE_NEW:
+	case I2CP_STATE_WAIT_FOR_XFER:
+	case I2CP_STATE_WAIT_FOR_REPLY:
+	case I2CP_STATE_XFER_RETURN:
+		mutex_unlock(&pdata->xfer_lock);
+		if (filep->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(
+			pdata->state_wait_queue,
+			i2cp_xfer_req_wait_cond(READ_ONCE(pdata->xfer_state)));
+		if (ret == -ERESTARTSYS)
+			return ret;
+		if (ret != 0)
+			return -ENOTRECOVERABLE;
+		/* ret == 0 */
+		goto check_xfer_state;
+	case I2CP_STATE_RETURN_THEN_SHUTDOWN:
+	case I2CP_STATE_SHUTDOWN:
+		ret = -ESHUTDOWN;
+		goto unlock;
+	default:
+		ret = -ENOTRECOVERABLE;
+		goto unlock;
+	}
+
+	arg_copy.output.xfer_id = pdata->xfer_id;
+	arg_copy.output.num_msgs = pdata->xfer_num_msgs;
+
+	BUILD_BUG_ON((void *)&arg_copy.output != (void *)&arg_copy);
+	if (copy_to_user(user_arg, &arg_copy.output, sizeof(arg_copy.output))) {
+		ret = -EFAULT;
+		goto unlock;
+	}
+	if (arg_copy.msgs_len < pdata->xfer_num_msgs) {
+		ret = -EMSGSIZE;
+		goto unlock;
+	}
+
+	ret = i2cp_xfer_req_copy_msgs(pdata->xfer_msgs, pdata->xfer_num_msgs,
+				      &arg_copy);
+	if (ret >= 0) {
+		WRITE_ONCE(pdata->xfer_state, I2CP_STATE_WAIT_FOR_REPLY);
+		wake_up_interruptible_sync(&pdata->state_wait_queue);
+		wake_up_interruptible_sync_poll(&pdata->poll_wait_queue,
+						EPOLLOUT);
+	}
+
+unlock:
+	mutex_unlock(&pdata->xfer_lock);
+	return ret;
+}
+
+static long i2cp_cdev_ioctl_xfer_reply(struct file *filep, unsigned long arg)
+{
+	long ret = 0;
+	struct i2c_msg *msgs_copy;
+	struct i2cp_ioctl_xfer_reply_arg arg_copy;
+	struct i2cp_ioctl_xfer_reply_arg __user *user_arg;
+	struct i2cp_controller *pdata;
+
+	user_arg = (void __user *)arg;
+	if (copy_from_user(&arg_copy, user_arg, sizeof(arg_copy)))
+		return -EFAULT;
+	pdata = filep->private_data;
+
+	mutex_lock(&pdata->xfer_lock);
+	switch (pdata->xfer_state) {
+	case I2CP_STATE_WAIT_FOR_REPLY:
+	case I2CP_STATE_WAIT_FOR_REQ:
+		break;
+	case I2CP_STATE_WAIT_FOR_XFER:
+		/* master_xfer already returned for pdata->xfer_id */
+		ret = arg_copy.xfer_id <= pdata->xfer_id ? -ETIME : -EINVAL;
+		goto unlock;
+	case I2CP_STATE_XFER_RETURN:
+		/* master_xfer has not yet returned for pdata->xfer_id */
+		ret = arg_copy.xfer_id < pdata->xfer_id ? -ETIME : -EINVAL;
+		goto unlock;
+	case I2CP_STATE_RETURN_THEN_SHUTDOWN:
+	case I2CP_STATE_SHUTDOWN:
+		ret = -ESHUTDOWN;
+		goto unlock;
+	case I2CP_STATE_NEW:
+		ret = -EINVAL;
+		goto unlock;
+	default:
+		ret = -ENOTRECOVERABLE;
+		goto unlock;
+	}
+
+	if (arg_copy.xfer_id != pdata->xfer_id) {
+		ret = arg_copy.xfer_id < pdata->xfer_id ? -ETIME : -EINVAL;
+		goto unlock;
+	}
+	if (arg_copy.num_msgs > pdata->xfer_num_msgs) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	msgs_copy = kcalloc(arg_copy.num_msgs, sizeof(*msgs_copy), GFP_KERNEL);
+	if (!msgs_copy) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	if (copy_from_user(msgs_copy, arg_copy.msgs,
+			   sizeof(*msgs_copy) * arg_copy.num_msgs)) {
+		ret = -EFAULT;
+		goto unlock;
+	}
+	for (u32 i = 0; i < arg_copy.num_msgs; ++i) {
+		if ((msgs_copy[i].flags & I2C_M_RD) &&
+		    copy_from_user(pdata->xfer_msgs[i].buf, msgs_copy[i].buf,
+				   pdata->xfer_msgs[i].len *
+				   sizeof(*(msgs_copy[i].buf)))) {
+			ret = -EFAULT;
+			goto unlock;
+		}
+	}
+
+	if (arg_copy.error > 0)
+		pdata->xfer_ret = min(-1, -(int)arg_copy.error);
+	else
+		pdata->xfer_ret = max(0, (int)arg_copy.num_msgs);
+
+	WRITE_ONCE(pdata->xfer_state, I2CP_STATE_XFER_RETURN);
+	wake_up_interruptible_sync(&pdata->state_wait_queue);
+
+unlock:
+	mutex_unlock(&pdata->xfer_lock);
+	return ret;
+}
+
+static long i2cp_cdev_ioctl_get_counters(struct file *filep, unsigned long arg)
+{
+	long ret;
+	struct i2cp_ioctl_xfer_counters __user *user_arg;
+	struct i2cp_controller *pdata;
+
+	pdata = filep->private_data;
+	user_arg = (void __user *)arg;
+
+	mutex_lock(&pdata->xfer_lock);
+	ret = copy_to_user(user_arg, &pdata->xfer_counters,
+			   sizeof(pdata->xfer_counters)) ? -EFAULT : 0;
+	mutex_unlock(&pdata->xfer_lock);
+	return ret;
+}
+
+static long i2cp_cdev_ioctl_shutdown(struct file *filep, unsigned long arg)
+{
+	struct i2cp_controller *pdata;
+
+	if (arg)
+		return -EINVAL;
+	pdata = filep->private_data;
+
+	mutex_lock(&pdata->xfer_lock);
+	WRITE_ONCE(pdata->xfer_state,
+		   (pdata->xfer_state == I2CP_STATE_XFER_RETURN) ?
+			   I2CP_STATE_RETURN_THEN_SHUTDOWN :
+			   I2CP_STATE_SHUTDOWN);
+	mutex_unlock(&pdata->xfer_lock);
+
+	wake_up_interruptible_all(&pdata->state_wait_queue);
+	wake_up_interruptible_all(&pdata->poll_wait_queue);
+	return 0;
+}
+
+static long i2cp_cdev_unlocked_ioctl(struct file *filep, unsigned int cmd,
+				     unsigned long arg)
+{
+	switch (cmd) {
+	case I2CP_IOCTL_XFER_REQ:
+		return i2cp_cdev_ioctl_xfer_req(filep, arg);
+	case I2CP_IOCTL_XFER_REPLY:
+		return i2cp_cdev_ioctl_xfer_reply(filep, arg);
+	case I2CP_IOCTL_GET_COUNTERS:
+		return i2cp_cdev_ioctl_get_counters(filep, arg);
+	case I2CP_IOCTL_START:
+		return i2cp_cdev_ioctl_start(filep, arg);
+	case I2CP_IOCTL_SHUTDOWN:
+		return i2cp_cdev_ioctl_shutdown(filep, arg);
+	}
+	return -ENOIOCTLCMD;
+}
+
+/*
+ * EPOLLIN indicates xfer request waiting for I2CP_IOCTL_XFER_REQ. This is what
+ * pollers will normally wait for in conjunction with O_NONBLOCK.
+ *
+ * EPOLLOUT indicates xfer request waiting for I2CP_IOCTL_XFER_REPLY. This is
+ * always the case immediately after successful I2CP_IOCTL_XFER_REQ, so polling
+ * for this is unnecessary, it is safe and recommended to call
+ * I2CP_IOCTL_XFER_REPLY as soon as a reply is ready.
+ *
+ * EPOLLHUP indicates I2CP_IOCTL_SHUTDOWN was called.
+ */
+static __poll_t i2cp_cdev_poll(struct file *filep, poll_table *ptp)
+{
+	__poll_t poll_ret;
+	struct i2cp_controller *pdata;
+
+	pdata = filep->private_data;
+	poll_wait(filep, &pdata->poll_wait_queue, ptp);
+
+	mutex_lock(&pdata->xfer_lock);
+	switch (pdata->xfer_state) {
+	case I2CP_STATE_WAIT_FOR_REQ:
+		poll_ret = EPOLLIN;
+		break;
+	case I2CP_STATE_WAIT_FOR_REPLY:
+		poll_ret = EPOLLOUT;
+		break;
+	case I2CP_STATE_RETURN_THEN_SHUTDOWN:
+	case I2CP_STATE_SHUTDOWN:
+		poll_ret = EPOLLHUP;
+		break;
+	default:
+		poll_ret = 0;
+	}
+	mutex_unlock(&pdata->xfer_lock);
+
+	return poll_ret;
+}
+
+static const struct file_operations i2cp_fileops = {
+	.owner = THIS_MODULE,
+	.open = i2cp_cdev_open,
+	.release = i2cp_cdev_release,
+	.unlocked_ioctl = i2cp_cdev_unlocked_ioctl,
+	.poll = i2cp_cdev_poll,
+	.llseek = no_llseek,
+};
+
+static ssize_t i2cp_open_count_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	int ret;
+	unsigned int count;
+	struct i2cp_device *i2cp_dev;
+
+	i2cp_dev = container_of(dev, struct i2cp_device, device);
+
+	mutex_lock(&i2cp_dev->count_lock);
+	count = i2cp_dev->count_open;
+	mutex_unlock(&i2cp_dev->count_lock);
+
+	ret = snprintf(buf, PAGE_SIZE, "%u\n", count);
+	if (ret >= PAGE_SIZE)
+		return -ERANGE;
+	return ret;
+}
+
+static struct device_attribute i2cp_open_count_dev_attr = {
+	.attr = {
+		.name = "open_count",
+		.mode = 0444,
+	},
+	.show = i2cp_open_count_show,
+};
+
+static struct attribute *i2cp_device_sysfs_attrs[] = {
+	&i2cp_open_count_dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group i2cp_device_sysfs_group = {
+	.attrs = i2cp_device_sysfs_attrs,
+};
+
+static const struct attribute_group *i2cp_device_sysfs_groups[] = {
+	&i2cp_device_sysfs_group,
+	NULL,
+};
+
+static inline void i2cp_device_release(struct device *dev)
+{
+	struct i2cp_device *i2cp_dev;
+
+	i2cp_dev = container_of(dev, struct i2cp_device, device);
+	kfree(i2cp_dev);
+}
+
+static int __init i2cp_init(void)
+{
+	int ret;
+
+	i2cp_class = class_create("i2c-pseudo");
+	if (IS_ERR(i2cp_class))
+		return PTR_ERR(i2cp_class);
+	i2cp_class->dev_groups = i2cp_device_sysfs_groups;
+
+	ret = alloc_chrdev_region(&i2cp_cdev_num, 0, i2cp_cdev_count,
+				  "i2c_pseudo");
+	if (ret < 0)
+		goto fail_after_class_create;
+
+	i2cp_device = kzalloc(sizeof(*i2cp_device), GFP_KERNEL);
+	if (!i2cp_device) {
+		ret = -ENOMEM;
+		goto fail_after_chrdev_register;
+	}
+
+	i2cp_device->device.devt = i2cp_cdev_num;
+	i2cp_device->device.class = i2cp_class;
+	i2cp_device->device.release = i2cp_device_release;
+	device_initialize(&i2cp_device->device);
+	ret = dev_set_name(&i2cp_device->device, "i2c-pseudo");
+	if (ret < 0)
+		goto fail_after_device_init;
+
+	mutex_init(&i2cp_device->count_lock);
+	cdev_init(&i2cp_device->cdev, &i2cp_fileops);
+	i2cp_device->cdev.owner = THIS_MODULE;
+
+	ret = cdev_device_add(&i2cp_device->cdev, &i2cp_device->device);
+	if (ret >= 0)
+		return 0;
+
+fail_after_device_init:
+	put_device(&i2cp_device->device);
+fail_after_chrdev_register:
+	unregister_chrdev_region(i2cp_cdev_num, i2cp_cdev_count);
+fail_after_class_create:
+	class_destroy(i2cp_class);
+	return ret;
+}
+
+static void __exit i2cp_exit(void)
+{
+	cdev_device_del(&i2cp_device->cdev, &i2cp_device->device);
+	put_device(&i2cp_device->device);
+	unregister_chrdev_region(i2cp_cdev_num, i2cp_cdev_count);
+	class_destroy(i2cp_class);
+}
+
+MODULE_AUTHOR("Matthew Blecker <matthewb@chromium.org");
+MODULE_DESCRIPTION("Driver for userspace I2C adapters");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("3.0");
+
+module_init(i2cp_init);
+module_exit(i2cp_exit);
diff --git a/include/uapi/linux/i2c-pseudo.h b/include/uapi/linux/i2c-pseudo.h
new file mode 100644
index 000000000000..19f4ad236ec6
--- /dev/null
+++ b/include/uapi/linux/i2c-pseudo.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * i2c-pseudo.h - I2C userspace adapter char device interface
+ *
+ * Copyright 2023 Google LLC
+ */
+
+#ifndef _UAPI_LINUX_I2C_PSEUDO_H
+#define _UAPI_LINUX_I2C_PSEUDO_H
+
+#include <linux/compiler.h>
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/* /dev/i2c-pseudo ioctl commands */
+#define I2CP_IOCTL_CODE 0x2C
+
+/*
+ * Create the I2C adapter device.
+ *
+ * *arg must be struct i2cp_ioctl_start_arg.
+ *
+ * Will only succeed at most once per fd lifetime.
+ *
+ * Non-negative return indicates success, upon which:
+ * - arg->output will have all fields overwritten.
+ * - No other fields of *arg will be modified.
+ *
+ * Negative return indicates an errno, upon which:
+ * - arg->output field values are undefined.
+ * - No other fields of *arg will be modified.
+ * - There is no I2C adapter device for this pseudo controller fd.
+ * - Retrying may succeed if the error condition is corrected.
+ */
+#define I2CP_IOCTL_START _IOWR(I2CP_IOCTL_CODE, 0, struct i2cp_ioctl_start_arg)
+
+/*
+ * Take in the next requested I2C transfer transaction.
+ *
+ * *arg must be struct i2cp_ioctl_xfer_req_arg.
+ *
+ * May only be used between I2CP_IOCTL_START and I2CP_IOCTL_SHUTDOWN.
+ *
+ * If no I2C transfer requests are pending will either block or set errno
+ * (to EAGAIN or EWOULDBLOCK) based on O_NONBLOCK flag.
+ *
+ * Non-negative return indicates success, upon which:
+ * - arg->output will have all fields overwritten
+ * - The first arg->output.num_msgs of arg->msgs will have all fields
+ *   overwritten.
+ * - Each such arg->msgs[i].buf will point to a section of arg->data_buf.
+ * - Each buf section will have all of its arg->msgs[i].len bytes overwritten.
+ * - The buf sections will not overlap between msgs, however multiple
+ *   zero-length sections may point to the same address.
+ * - No other fields of *arg will be modified.
+ *
+ * Negative return indicates an errno. Some errno have special output semantics.
+ *
+ * EMSGSIZE:
+ * - arg->msgs_len indicates arg->msgs is of insufficient size to hold all
+ *   i2c_msg for the requested transaction.
+ * - arg->output will be filled in the same as a successful call, but no portion
+ *   of either arg->msgs or arg->data_buf will be modified.
+ * - Thus arg->output.num_msgs will indicate the arg->msgs_len needed for this
+ *   transaction.
+ * - A retry with a sufficiently large arg->msgs_len may be successful.
+ *   If no such retry will be attempted, it is best to use I2CP_IOCTL_XFER_REPLY
+ *   with a non-zero error value to unblock the requesting I2C device driver
+ *   from the I2C adapter timeout.
+ *
+ * ENOBUFS:
+ * - arg->data_buf_len indicates arg->data_buf is of insufficient size to hold
+ *   all i2c_msg.buf for the requested transaction.
+ * - arg->output and each arg->msgs will be filled in the same as a successful
+ *   call, except each i2c_msg.buf will be NULL and no portion of arg->data_buf
+ *   will be modified.
+ * - Thus the sum of each i2c_msg.len will indicate the arg->data_buf_len needed
+ *   for this transaction.
+ * - A retry with a sufficiently large arg->data_buf may be successful.
+ *   If no such retry will be attempted, it is best to use I2CP_IOCTL_XFER_REPLY
+ *   with a non-zero error value to unblock the requesting I2C device driver
+ *   from the I2C adapter timeout.
+ */
+#define I2CP_IOCTL_XFER_REQ _IOWR(I2CP_IOCTL_CODE, 1, struct i2cp_ioctl_xfer_req_arg)
+
+/*
+ * Reply to the most recent I2C transfer request from I2CP_IOCTL_XFER_REQ.
+ *
+ * *arg must be struct i2cp_ioctl_xfer_reply_arg, which is never modified by
+ * this.
+ *
+ * Non-negative return indicates success, negative indicates an errno.
+ * Some errno have a specific meaning.
+ *
+ * ETIME: The *arg->xfer_id is for a transfer request that already received a
+ * reply, either from a prior I2CP_IOCTL_XFER_REQ call, or from exceeding the
+ * I2C adapter timeout.
+ */
+#define I2CP_IOCTL_XFER_REPLY _IOW(I2CP_IOCTL_CODE, 2, struct i2cp_ioctl_xfer_reply_arg)
+
+/*
+ * Report counters of I2C transfers requested of this pseudo controller.
+ *
+ * *arg must be struct i2cp_ioctl_xfer_counters.
+ *
+ * Non-negative return indicates success, upon which *arg will have all fields
+ * overwritten.
+ *
+ * Negative return indicates an errno, upon which all *arg fields are undefined.
+ *
+ * Each I2C transfer requested of this pseudo adapter by an I2C device driver
+ * will result in exactly one counter field increment.
+ *
+ * Counter increment happens once success or failure is known. Transfers still
+ * waiting for a reply are not yet counted.
+ *
+ * The sum of all *arg fields is the total number of I2C transfers requested of
+ * this pseudo controller, except for those still waiting for a reply.
+ */
+#define I2CP_IOCTL_GET_COUNTERS _IOR(I2CP_IOCTL_CODE, 3, struct i2cp_ioctl_xfer_counters)
+
+/*
+ * Unblock all pseudo controller I/O and refuse further I2C transfer requests.
+ *
+ * Use of this is _optional_ for userspace convenience to unblock any threads
+ * waiting or polling for I2C transfer requests.
+ *
+ * It is safe and allowed to call this repeatedly, though after any successful
+ * call it is not expected for subsequent calls to do anything useful.
+ *
+ * arg must be NULL and is reserved for possible future use.
+ *
+ * Non-negative return indicates success, negative return indicates an errno.
+ *
+ * This will never fail if the fd is correct and arg is NULL.
+ */
+#define I2CP_IOCTL_SHUTDOWN _IO(I2CP_IOCTL_CODE, 4)
+
+/* Filled in by I2CP_IOCTL_START */
+struct i2cp_ioctl_start_output {
+	/* I2C adapter number from I2C subsystem */
+	__u64 adapter_num;
+	/*
+	 * The length of i2cp_ioctl_start_arg.name that was actually used, not
+	 * including any Null termination.
+	 */
+	__u32 name_len;
+};
+
+/* Argument for I2CP_IOCTL_START */
+struct i2cp_ioctl_start_arg {
+	/* output; must be first struct field */
+	struct i2cp_ioctl_start_output output;
+	/*
+	 * Bitmask of I2C_FUNC_* flags.
+	 * I2C_FUNC_I2C is currently mandatory (this may change).
+	 * I2C_FUNC_SMBUS_EMUL or any subset is optional.
+	 * No other functionality flags are supported yet.
+	 * Additional flags may be supported in the future.
+	 * Setting unsupported flags is an error.
+	 */
+	__u32 functionality;
+	/*
+	 * I2C transaction timeout in milliseconds.
+	 * If 0 the i2c-pseudo module parameter default_timeout_ms will be used.
+	 * If default_timeout_ms itself is 0 the subsystem default will be used.
+	 */
+	__u32 timeout_ms;
+	/*
+	 * I2C adapter name, Null-terminated. Must be non-NULL.
+	 * The maximum length allowed is an internal subsystem detail, so if
+	 * exceeding that length is allowed and the name will simply be cut off
+	 * at the maximum length permitted. See output.name_len for the actual
+	 * length that was used, not including Null termination.
+	 */
+	const char __user *name;
+};
+
+/* Filled in by I2CP_IOCTL_XFER_REQ */
+struct i2cp_ioctl_xfer_req_output {
+	/*
+	 * Identifier for this I2C transfer request.
+	 * Will never be reused for this pseudo controller instance unless an
+	 * internal counter wraps.
+	 */
+	__u64 xfer_id;
+	/* Number of i2c_msg in this transfer request. */
+	__u32 num_msgs;
+};
+
+/* Argument for I2CP_IOCTL_XFER_REQ */
+struct i2cp_ioctl_xfer_req_arg {
+	/* must be first struct field */
+	struct i2cp_ioctl_xfer_req_output output;
+	/* must point to array of at least msgs_len length */
+	struct i2c_msg __user *msgs;
+	/* must point to array of at least data_buf_len length */
+	__u8 __user *data_buf;
+	/* length of msgs array, must be positive */
+	__u32 msgs_len;
+	/* length of data_buf array, must be positive */
+	__u32 data_buf_len;
+};
+
+/* Argument for I2CP_IOCTL_XFER_REPLY */
+struct i2cp_ioctl_xfer_reply_arg {
+	/*
+	 * Must point to array of num_msgs length whose i2c_msg contents matches
+	 * the msgs from I2CP_IOCTL_XFER_REQ for this xfer_id.
+	 *
+	 * For I2C reads (i2c_msg.flags & I2C_M_RD) the i2c_msg.buf content will
+	 * be copied back to the requesting I2C device driver.
+	 *
+	 * This need not point to the same memory used with I2CP_IOCTL_XFER_REQ,
+	 * nor do the i2c_msg.buf pointers, however simply reusing the same
+	 * memory is permissible and expected.
+	 */
+	struct i2c_msg __user *msgs;
+	/* i2cp_ioctl_xfer_req_arg.output.xfer_id this reply is for. */
+	__u64 xfer_id;
+	/*
+	 * Number of I2C messages successfully processed.
+	 * Gets returned to I2C device driver.
+	 * Indicates length of msgs array.
+	 * Must be <= i2cp_ioctl_xfer_req_output.num_msgs from the xfer_id.
+	 * Any value < i2cp_ioctl_xfer_req_output.num_msgs implies a failure.
+	 */
+	__u32 num_msgs;
+	/*
+	 * Return value for master_xfer.
+	 * Gets returned to I2C device driver.
+	 * Set to 0 (zero) for a successful I2C transaction.
+	 */
+	__u32 error;
+};
+
+/* Argument for and filled in by I2CP_IOCTL_GET_COUNTERS */
+struct i2cp_ioctl_xfer_counters {
+	/* I2CP_IOCTL_XFER_REPLY received */
+	__u64 controller_replied;
+	/* kernel bug */
+	__u64 unknown_failure;
+	/* master_xfer after I2CP_IOCTL_SHUTDOWN */
+	__u64 after_shutdown;
+	/* master_xfer with num_msgs >= max_msgs_per_xfer */
+	__u64 too_many_msgs;
+	/* master_xfer with sum(i2c_msg.len) > max_total_data_per_xfer */
+	__u64 too_much_data;
+	/* interrupted before I2CP_IOCTL_XFER_REQ */
+	__u64 interrupted_before_req;
+	/* interrupted after I2CP_IOCTL_XFER_REQ before I2CP_IOCTL_XFER_REPLY */
+	__u64 interrupted_before_reply;
+	/* timed out before I2CP_IOCTL_XFER_REQ */
+	__u64 timed_out_before_req;
+	/* timed out after I2CP_IOCTL_XFER_REQ before I2CP_IOCTL_XFER_REPLY */
+	__u64 timed_out_before_reply;
+};
+
+#endif /* _UAPI_LINUX_I2C_PSEUDO_H */
diff --git a/samples/i2c-pseudo/.gitignore b/samples/i2c-pseudo/.gitignore
new file mode 100644
index 000000000000..34622ae2686a
--- /dev/null
+++ b/samples/i2c-pseudo/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+/i2c-adapter-example
diff --git a/samples/i2c-pseudo/Makefile b/samples/i2c-pseudo/Makefile
new file mode 100644
index 000000000000..2b80fb544655
--- /dev/null
+++ b/samples/i2c-pseudo/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+userprogs-always-y += i2c-adapter-example
+
+userccflags += -I usr/include
+
+.PHONY: all clean
+
+all:
+	$(MAKE) -C ../.. samples/i2c-pseudo/
+
+clean:
+	$(MAKE) -C ../.. M=samples/i2c-pseudo/ clean
diff --git a/samples/i2c-pseudo/i2c-adapter-example.c b/samples/i2c-pseudo/i2c-adapter-example.c
new file mode 100644
index 000000000000..38c457fdfef7
--- /dev/null
+++ b/samples/i2c-pseudo/i2c-adapter-example.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I2C adapter userspace example
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This example shows how to use the i2c-pseudo module UAPI.
+ * This program starts an I2C adapter and prints the I2C transfers it receives.
+ * I2C reads are filled by reading from stdin.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+
+#include <fcntl.h>
+#include <linux/i2c-pseudo.h>
+#include <linux/i2c.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#define MAX_MSGS_PER_XFER 6
+#define MAX_DATA_PER_XFER 30
+
+/* Start the I2C adapter. Returns 0 if successful, errno otherwise. */
+static int start_adapter(int fd)
+{
+	int ret;
+	struct i2cp_ioctl_start_arg start_arg = {
+		.functionality = I2C_FUNC_I2C,
+		.timeout_ms = 5000,
+		.name = "example userspace I2C adapter",
+	};
+
+	if (ioctl(fd, I2CP_IOCTL_START, &start_arg) < 0) {
+		ret = errno;
+		perror("I2CP_IOCTL_START failed");
+		return ret;
+	}
+	printf("adapter_num=%llu\n",
+	       (unsigned long long)start_arg.output.adapter_num);
+	return 0;
+}
+
+/* Fill msg->buf from stdin. Returns 0 if successful, errno otherwise. */
+static int fill_read_buf(struct i2c_msg *msg)
+{
+	int ret;
+
+	for (int i = 0; i < msg->len; i += ret) {
+		ret = read(0, &msg->buf[i], msg->len - i);
+		if (ret < 0) {
+			ret = errno;
+			perror("stdin read() failed");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+/* Print msg to stdout. Returns 0 if successful, errno otherwise. */
+static int print_msg(struct i2c_msg *msg)
+{
+	int ret;
+
+	printf("addr=0x%02hx flags=0x%02hx len=%hu ", (short)msg->addr,
+	       (short)msg->flags, (short)msg->len);
+	if (!(msg->flags & I2C_M_RD)) {
+		printf("write=[");
+	} else {
+		printf("read=[");
+		/* stdin source may need to see the "read=" request */
+		fflush(stdout);
+		ret = fill_read_buf(msg);
+		if (ret)
+			return ret;
+	}
+	for (int i = 0; i < msg->len; i++) {
+		if (i)
+			printf(" ");
+		printf("0x%02hhx", msg->buf[i]);
+	}
+	printf("]\n");
+	return 0;
+}
+
+/* Process I2C transfers. Returns errno upon any interruption or failure. */
+static int xfer_loop(int fd)
+{
+	int ret;
+	struct i2c_msg msgs[MAX_MSGS_PER_XFER];
+	__u8 data_buf[MAX_DATA_PER_XFER];
+	struct i2cp_ioctl_xfer_req_arg req_arg = {
+		.msgs = &msgs[0],
+		.msgs_len = MAX_MSGS_PER_XFER,
+		.data_buf = &data_buf[0],
+		.data_buf_len = MAX_DATA_PER_XFER,
+	};
+	struct i2cp_ioctl_xfer_reply_arg reply_arg = {
+		.msgs = &msgs[0],
+	};
+
+	for (;;) {
+		if (ioctl(fd, I2CP_IOCTL_XFER_REQ, &req_arg) < 0) {
+			ret = errno;
+			perror("I2CP_IOCTL_XFER_REQ failed");
+			switch (ret) {
+			case ENOBUFS:
+			case EMSGSIZE:
+				break;
+			default:
+				return ret;
+			}
+			reply_arg.num_msgs = 0;
+			reply_arg.error = ret;
+		} else {
+			reply_arg.num_msgs = 0;
+			reply_arg.error = 0;
+			printf("\nbegin transaction\n");
+			for (int i = 0; i < req_arg.output.num_msgs; i++) {
+				ret = print_msg(&msgs[i]);
+				if (ret) {
+					reply_arg.error = ret;
+					break;
+				}
+				reply_arg.num_msgs++;
+			}
+			if (!reply_arg.error)
+				printf("end transaction\n");
+		}
+		reply_arg.xfer_id = req_arg.output.xfer_id;
+		if (ioctl(fd, I2CP_IOCTL_XFER_REPLY, &reply_arg) < 0) {
+			ret = errno;
+			perror("I2CP_IOCTL_XFER_REPLY failed");
+			if (!reply_arg.error)
+				return ret;
+		}
+		if (reply_arg.error)
+			return reply_arg.error;
+	}
+}
+
+int main(void)
+{
+	int fd;
+
+	fd = open("/dev/i2c-pseudo", O_RDWR);
+	if (fd < 0) {
+		perror("Failed to open() i2c-pseudo device file");
+		return 1;
+	}
+	if (start_adapter(fd))
+		return 2;
+	if (xfer_loop(fd))
+		return 3;
+	if (close(fd) < 0) {
+		perror("Failed to close() i2c-pseudo device file");
+		return 4;
+	}
+	return 0;
+}
-- 
2.43.0.472.g3155946c3a-goog


