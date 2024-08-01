Return-Path: <linux-i2c+bounces-5102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3994505A
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 18:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E42BB21649
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812551B5812;
	Thu,  1 Aug 2024 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="c++ZVqz9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D251B4C27;
	Thu,  1 Aug 2024 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528920; cv=none; b=pbW+qfAZc10PKXafxvpcgc37BnmMQuPYjPf16u3mhl8XBGBymO6heu6PsfaXd1Aw+KMdtSjRwBS+cXnWYNPVaqJwPSf091lQR33tRKcEeTBhk6OvVLjHHcWsODfL8QnYrCjhvbhCYRe8Lq3UlJ4zRmOdP6Ejib096CroIKR4L6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528920; c=relaxed/simple;
	bh=ve2Z60/u4vYGxsVF5EbwU+MxNfj5hFEd2qPeFNhwQjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuX9NO+fUIpcHXlnyYWhee+f9IlSRiOLh7qxIybMyiDZLw1g/4Uwpq1DOkYSEIs/0TC38HkIYFMKEVN76H6wEnXkEgJasFS8VKi01TOdg1tLxPIm8GY+sgPmPeNzWmfayjIeT8eaZIBpUwtQi1y4XBMY+I3Xj0JfXZOWTr/TXY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=c++ZVqz9; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id AE565456D905;
	Thu,  1 Aug 2024 12:06:24 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1722528383; x=1724342784; bh=ve2Z6
	0/u4vYGxsVF5EbwU+MxNfj5hFEd2qPeFNhwQjA=; b=c++ZVqz9BbEKCj6bozoo7
	UqiReKeBZSAwcLDwILp+MWal18gEK4adKieyGD8OlfI9yy8TE7IvIO5JHqaM9kdm
	TZ6YnNTba3s0ydcZuMGvjSpEq3N1K9zAzm7k5F/zCZ/OkQFAK3oACRSeq931q+Ot
	XdLozC5hUvNlsqEexTeoRo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xF_iyKVqhisv; Thu,  1 Aug 2024 12:06:23 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id D532B40DFF45;
	Thu,  1 Aug 2024 12:06:22 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	linux-mm@kvack.org,
	lee@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS interface
Date: Thu,  1 Aug 2024 12:06:09 -0400
Message-ID: <20240801160610.101859-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801160610.101859-1-mstrodl@csh.rit.edu>
References: <20240801160610.101859-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Congatec CGEB is a BIOS interface found on some Congatec x86
modules. It provides access to on board peripherals like I2C busses
and watchdogs. This driver contains the basic support for accessing
the CGEB interface and registers the child devices.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/mfd/Kconfig               |   10 +
 drivers/mfd/Makefile              |    1 +
 drivers/mfd/congatec-cgeb.c       | 1139 +++++++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h |  111 +++
 include/uapi/linux/connector.h    |    4 +-
 5 files changed, 1264 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mfd/congatec-cgeb.c
 create mode 100644 include/linux/mfd/congatec-cgeb.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 266b4f54af60..fa06a9dc34f9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1206,6 +1206,16 @@ config MFD_RT5120
 	  is targeted at providing the CPU voltage, memory, I/O and peripheral
 	  power rails in home entertainment devices.
=20
+config MFD_CONGATEC_CGEB
+	tristate "Support for the Congatec CGEB BIOS interface"
+	depends on X86
+	help
+	  The Congatec CGEB BIOS interface provides access to onboard
+	  peripherals like I2C busses and watchdogs. additional drivers must be
+	  enabled in order to use the functionality of the device.
+	  Say y or m here if you are using a congatec module with CGEB interfac=
e,
+	  otherwise say n.
+
 config MFD_RC5T583
 	bool "Ricoh RC5T583 Power Management system device"
 	depends on I2C=3Dy
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e..38f31841ac88 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -217,6 +217,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS)	+=3D intel-lpss.o
 obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+=3D intel-lpss-pci.o
 obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+=3D intel-lpss-acpi.o
 obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+=3D intel_pmc_bxt.o
+obj-$(CONFIG_MFD_CONGATEC_CGEB)	+=3D congatec-cgeb.o
 obj-$(CONFIG_MFD_PALMAS)	+=3D palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    +=3D viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+=3D ntxec.o
diff --git a/drivers/mfd/congatec-cgeb.c b/drivers/mfd/congatec-cgeb.c
new file mode 100644
index 000000000000..6cdfb3c36e35
--- /dev/null
+++ b/drivers/mfd/congatec-cgeb.c
@@ -0,0 +1,1139 @@
+/*
+ * CGEB driver
+ *
+ * Copyright (c) 2024 Mary Strodl
+ *
+ * Based on code from Congatec AG and Sascha Hauer
+ *
+ * CGEB is a BIOS interface found on congatech modules. It consists of
+ * code found in the BIOS memory map which is called in a ioctl like
+ * fashion. This file contains the basic driver for this interface
+ * which provides access to the GCEB interface and registers the child
+ * devices like I2C busses and watchdogs.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/io.h>
+#include <linux/string.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/mm.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/connector.h>
+#include <linux/mfd/congatec-cgeb.h>
+#include <linux/completion.h>
+
+#include <generated/autoconf.h>
+
+#define CGOS_BOARD_MAX_SIZE_ID_STRING 16
+
+#define CGEB_VERSION_MAJOR 1
+
+#define CGEB_GET_VERSION_MAJOR(v) (((unsigned long)(v)) >> 24)
+
+/* CGEB Low Descriptor located in 0xc0000-0xfffff */
+#define CGEB_LD_MAGIC "$CGEBLD$"
+
+#pragma pack(push,4)
+
+struct cgeb_low_desc {
+	char magic[8];          /* descriptor magic string */
+	u16 size;               /* size of this descriptor */
+	u16 reserved;
+	char bios_name[8];      /* BIOS name and revision "ppppRvvv" */
+	u32 hi_desc_phys_addr;  /* phys addr of the high descriptor, can be 0 *=
/
+};
+
+/* CGEB High Descriptor located in 0xfff00000-0xffffffff */
+#ifdef CONFIG_X86_64
+#define CGEB_HD_MAGIC "$CGEBQD$"
+#else
+#define CGEB_HD_MAGIC "$CGEBHD$"
+#endif
+
+struct cgeb_high_desc {
+	char magic[8];          /* descriptor magic string */
+	u16 size;               /* size of this descriptor */
+	u16 reserved;
+	u32 data_size;          /* CGEB data area size */
+	u32 code_size;          /* CGEB code area size */
+	u32 entry_rel;          /* CGEB entry point relative to start */
+};
+
+struct cgeb_far_ptr {
+	void __user *off;
+	u16 seg;
+	u16 pad;
+};
+
+struct cgeb_fps {
+	u32 size;               /* size of the parameter structure */
+	u32 fct;                /* function number */
+	struct cgeb_far_ptr data;       /* CGEB data area */
+	void __user *cont;      /* private continuation pointer */
+	void __user *subfps;    /* private sub function parameter
+				 * structure pointer
+				 */
+	void __user *subfct;    /* sub function pointer */
+	u32 status;             /* result codes of the function */
+	u32 unit;               /* unit number or type */
+	u32 pars[4];            /* input parameters */
+	u32 rets[2];            /* return parameters */
+	void __user *iptr;      /* input pointer */
+	void __user *optr;      /* output pointer */
+};
+
+/* continuation status codes */
+#define CGEB_SUCCESS            0
+#define CGEB_NEXT               1
+#define CGEB_DELAY              2
+#define CGEB_NOIRQS             3
+
+#define CGEB_DBG_STR        0x100
+#define CGEB_DBG_HEX        0x101
+#define CGEB_DBG_DEC        0x102
+
+struct cgeb_map_mem {
+	void *phys;             /* physical address */
+	u32 size;               /* size in bytes */
+	struct cgeb_far_ptr virt;
+};
+
+struct cgeb_map_mem_list {
+	u32 count;              /* number of memory map entries */
+	struct cgeb_map_mem entries[];
+};
+
+struct cgeb_boardinfo {
+	u32 size;
+	u32 flags;
+	u32 classes;
+	u32 primary_class;
+	char board[CGOS_BOARD_MAX_SIZE_ID_STRING];
+	/* optional */
+	char vendor[CGOS_BOARD_MAX_SIZE_ID_STRING];
+};
+
+struct cgeb_i2c_info {
+	u32 size;
+	u32 type;
+	u32 frequency;
+	u32 maxFrequency;
+};
+
+#pragma pack(pop)
+
+/* I2C Types */
+#define CGEB_I2C_TYPE_UNKNOWN 0
+#define CGEB_I2C_TYPE_PRIMARY 1
+#define CGEB_I2C_TYPE_SMB     2
+#define CGEB_I2C_TYPE_DDC     3
+#define CGEB_I2C_TYPE_BC      4
+
+struct cgeb_board_data {
+	void __user *data;
+	void __user *code;
+	size_t code_size;
+	u16 ds;
+	struct cgeb_map_mem_list *map_mem;
+	void __user *map_mem_user;
+	struct platform_device **devices;
+	int num_devices;
+
+	#ifdef CONFIG_X86_64
+	void (*entry)(void*, struct cgeb_fps *, struct cgeb_fps *, void*);
+	#else
+	/*
+	 * entry points to a bimodal C style function that expects a far pointe=
r
+	 * to a fps. If cs is 0 then it does a near return, otherwise a far
+	 * return. If we ever need a far return then we must not pass cs at all=
.
+	 * parameters are removed by the caller.
+	 */
+	void __attribute__((regparm(0)))(*entry)(unsigned short,
+			  struct cgeb_fps *, unsigned short);
+	#endif
+};
+
+struct cgeb_call_user {
+	void *optr;
+	size_t size;
+	void *callback_data;
+	int (*callback)(void __user *, void *, void *);
+};
+
+enum cgeb_msg_type {
+	CGEB_MSG_ACK =3D 0,
+	CGEB_MSG_ERROR,
+	CGEB_MSG_FPS,
+	CGEB_MSG_MAPPED,
+	CGEB_MSG_MAP,
+	CGEB_MSG_CODE,
+	CGEB_MSG_ALLOC,
+	CGEB_MSG_ALLOC_CODE,
+	CGEB_MSG_FREE,
+	CGEB_MSG_MUNMAP,
+	CGEB_MSG_CALL,
+	CGEB_MSG_PING,
+};
+
+struct cgeb_msg {
+	enum cgeb_msg_type type;
+	union {
+		struct cgeb_msg_mapped {
+			void *virt;
+		} mapped;
+		struct cgeb_msg_fps {
+			size_t optr_size;
+			void *optr;
+			struct cgeb_fps fps;
+		} fps;
+		struct cgeb_msg_code {
+			size_t length;
+			uint32_t entry_rel;
+			void *data;
+		} code;
+		struct cgeb_msg_map {
+			uint32_t phys;
+			size_t size;
+		} map;
+	};
+};
+
+static char cgeb_helper_path[PATH_MAX] =3D "/sbin/cgeb-helper";
+
+static struct cb_id cgeb_cn_id =3D {
+	.idx =3D CN_IDX_CGEB,
+	.val =3D CN_VAL_CGEB
+};
+
+enum cgeb_request_state {
+	CGEB_REQ_IDLE =3D 0,
+	CGEB_REQ_ACTIVE,
+	CGEB_REQ_DONE,
+};
+
+static DEFINE_MUTEX(cgeb_lock);
+struct cgeb_request {
+	struct completion done;
+	struct cgeb_msg *out;
+	enum cgeb_request_state busy;
+	int ack;
+	int (*callback)(struct cgeb_msg*, void*);
+	void *user;
+};
+
+#define CGEB_REQUEST_MAX 16
+static struct cgeb_request cgeb_requests[CGEB_REQUEST_MAX];
+
+struct cgeb_after_alloc_data {
+	void *kernel;
+	void __user **user;
+	size_t length;
+};
+
+struct cgeb_map_data {
+	void __user *user_list;
+	struct cgeb_board_data *board;
+};
+
+static int cgeb_helper_start(void)
+{
+	char *envp[] =3D {
+		NULL,
+	};
+
+	char *argv[] =3D {
+		cgeb_helper_path,
+		NULL,
+	};
+
+	return call_usermodehelper(cgeb_helper_path, argv, envp, UMH_WAIT_EXEC)=
;
+}
+
+static int cgeb_request(struct cgeb_msg msg, struct cgeb_msg *out,
+			int (*callback)(struct cgeb_msg*, void*), void *user)
+{
+	static int seq;
+	struct cn_msg *wrapper;
+	struct cgeb_request *req;
+	int err, retries =3D 0;
+
+	wrapper =3D (struct cn_msg*) kzalloc(sizeof(*wrapper) + sizeof(msg),
+					   GFP_KERNEL);
+	if (!wrapper)
+		return -ENOMEM;
+
+	memset(wrapper, 0, sizeof(*wrapper));
+	memcpy(&wrapper->id, &cgeb_cn_id, sizeof(cgeb_cn_id));
+
+	wrapper->len =3D sizeof(msg);
+	wrapper->ack =3D get_random_u32();
+	memcpy(wrapper + 1, &msg, sizeof(msg));
+
+	mutex_lock(&cgeb_lock);
+
+	req =3D &cgeb_requests[seq];
+
+	if (req->busy) {
+		mutex_unlock(&cgeb_lock);
+		err =3D -EBUSY;
+		goto out;
+	}
+	wrapper->seq =3D seq;
+	req->busy =3D CGEB_REQ_ACTIVE;
+	req->ack =3D wrapper->ack;
+	req->out =3D out;
+	req->callback =3D callback;
+	req->user =3D user;
+
+	err =3D cn_netlink_send(wrapper, 0, 0, GFP_KERNEL);
+	if (err =3D=3D -ESRCH) {
+		err =3D cgeb_helper_start();
+		if (err) {
+			pr_err("failed to execute %s\n", cgeb_helper_path);
+			pr_err("make sure that the cgeb helper is installed and"
+			       " executable\n");
+		} else {
+			do {
+				err =3D cn_netlink_send(wrapper, 0, 0,
+						      GFP_KERNEL);
+				if (err =3D=3D -ENOBUFS)
+					err =3D 0;
+				if (err =3D=3D -ESRCH)
+					msleep(30);
+			} while (err =3D=3D -ESRCH && ++retries < 5);
+		}
+	} else if (err =3D=3D -ENOBUFS)
+		err =3D 0;
+
+	kfree(wrapper);
+
+	if (++seq >=3D CGEB_REQUEST_MAX)
+		seq =3D 0;
+
+	mutex_unlock(&cgeb_lock);
+
+	if (err)
+		goto out;
+
+	/* Wait for a response to the request */
+	err =3D wait_for_completion_interruptible_timeout(
+		&req->done, msecs_to_jiffies(20000));
+	if (err =3D=3D 0) {
+		pr_err("CGEB: Timed out running request of type %d!\n",
+		       msg.type);
+		err =3D -ETIMEDOUT;
+	} else if (err > 0)
+		err =3D 0;
+
+	if (err)
+		goto out;
+
+	mutex_lock(&cgeb_lock);
+
+	if (req->busy !=3D CGEB_REQ_DONE) {
+		pr_err("CGEB: BUG: Request is in a bad state?\n");
+		err =3D -EINVAL;
+	}
+
+	req->busy =3D CGEB_REQ_IDLE;
+	mutex_unlock(&cgeb_lock);
+out:
+	return err;
+}
+
+static void cgeb_cn_callback(struct cn_msg *msg, struct netlink_skb_parm=
s *nsp)
+{
+	struct cgeb_request *req;
+	if (!capable(CAP_SYS_ADMIN))
+		return;
+
+	if (msg->seq >=3D CGEB_REQUEST_MAX) {
+		pr_err("CGEB: Impossible sequence number: %d! Ignoring\n",
+		       msg->seq);
+		return;
+	}
+
+	mutex_lock(&cgeb_lock);
+	req =3D &cgeb_requests[msg->seq];
+
+	if (!req->busy || req->ack !=3D msg->ack) {
+		pr_err("CGEB: Bad response to request %d! Ignoring\n",
+		       msg->seq);
+		mutex_unlock(&cgeb_lock);
+		return;
+	}
+
+	if (msg->len !=3D sizeof(*req->out)) {
+		pr_err("CGEB: Bad response size for request %d!\n", msg->seq);
+		mutex_unlock(&cgeb_lock);
+		return;
+	}
+
+	pr_debug("Got a response to request %d!\n", msg->seq);
+
+	memcpy(req->out, &msg->data, sizeof(*req->out));
+
+	req->busy =3D CGEB_REQ_DONE;
+	mutex_unlock(&cgeb_lock);
+
+	if (req->callback)
+		req->callback(req->out, req->user);
+
+	complete(&req->done);
+
+	return;
+}
+
+static int cgeb_copy_to_user(struct cgeb_msg *resp, void *user)
+{
+	struct cgeb_high_desc *high_desc;
+	unsigned long uncopied;
+	high_desc =3D user;
+	uncopied =3D copy_to_user(resp->code.data, high_desc,
+				high_desc->code_size);
+	if (uncopied) {
+		pr_err("CGEB: Couldn't copy code into userspace! %ld\n",
+		       uncopied);
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static int cgeb_upload_code(struct cgeb_high_desc *high_desc,
+			    struct cgeb_board_data *board)
+{
+	struct cgeb_msg req =3D {0}, resp;
+	size_t len =3D high_desc->code_size;
+	int ret =3D 0;
+
+	req.type =3D CGEB_MSG_ALLOC_CODE;
+	req.code.length =3D len;
+	pr_debug("CGEB: Allocating memory for code\n");
+	ret =3D cgeb_request(req, &resp, cgeb_copy_to_user, high_desc);
+	if (ret)
+		goto out;
+	if (resp.type !=3D CGEB_MSG_CODE) {
+		pr_err("CGEB: Bad response type for alloc: %d\n", resp.type);
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	board->code =3D resp.code.data;
+	board->code_size =3D len;
+
+	req.type =3D CGEB_MSG_CODE;
+	req.code.data =3D resp.code.data;
+	req.code.entry_rel =3D high_desc->entry_rel;
+	req.code.length =3D len;
+
+	pr_debug("CGEB: Uploading code\n");
+	ret =3D cgeb_request(req, &resp, NULL, NULL);
+
+	if (ret)
+		goto out;
+
+	/* Do stuff with response */
+	if (resp.type !=3D CGEB_MSG_ACK) {
+		pr_err("CGEB: Failed to upload code! Got non-ack response!\n");
+		ret =3D -EINVAL;
+	}
+
+out:
+	return ret;
+}
+
+static unsigned short get_data_segment(void)
+{
+	unsigned short ret;
+
+#ifdef CONFIG_X86_64
+	ret =3D 0;
+#else
+	asm volatile("mov %%ds, %0\n"
+			  : "=3Dr"(ret)
+			  :
+			  : "memory"
+	);
+#endif
+
+	return ret;
+}
+
+static int cgeb_after_call(struct cgeb_msg *resp, void *user)
+{
+	int ret =3D 0;
+	int alloc_size;
+	struct cgeb_call_user *data =3D user;
+	if (!resp->fps.fps.optr)
+		return ret;
+
+	switch(resp->fps.fps.status) {
+	case CGEB_NEXT:
+	case CGEB_NOIRQS:
+	case CGEB_DELAY:
+	case CGEB_DBG_HEX:
+	case CGEB_DBG_DEC:
+		/* These lead to continuations, we don't need their memory */
+		return ret;
+
+	/* Everything else we could need */
+	case CGEB_DBG_STR:
+		data->size =3D alloc_size =3D strnlen_user(resp->fps.fps.optr, 1023);
+		if (alloc_size > 1023) {
+			data->size =3D 1023;
+			alloc_size =3D data->size + 1;
+		}
+		/* Special case, because these come from program memory */
+		data->optr =3D kzalloc(alloc_size, GFP_KERNEL);
+		if (!data->optr)
+			return -ENOMEM;
+	}
+
+	ret =3D copy_from_user(data->optr, resp->fps.fps.optr, data->size);
+
+	if (ret) {
+		pr_err("CGEB: Couldn't copy optr out of userspace! %d\n", ret);
+		ret =3D -ENOMEM;
+	}
+
+	if (resp->fps.fps.status =3D=3D CGEB_SUCCESS && data->callback) {
+		data->callback(resp->fps.fps.optr, data->optr,
+			       data->callback_data);
+	}
+
+	return ret;
+}
+
+static int cgeb_after_alloc(struct cgeb_msg *resp, void *user)
+{
+	int ret;
+	struct cgeb_after_alloc_data *data =3D user;
+
+	ret =3D copy_to_user(resp->code.data, data->kernel, data->length);
+
+	if (ret) {
+		pr_err("CGEB: Couldn't copy iptr into userspace! %d\n", ret);
+
+		ret =3D -ENOMEM;
+	}
+
+	*data->user =3D resp->code.data;
+
+	return ret;
+}
+
+static int cgeb_get_user_ptr(void *kernel, void __user **user, size_t le=
ngth)
+{
+	struct cgeb_msg req =3D {0}, resp;
+	struct cgeb_after_alloc_data data;
+
+	data.kernel =3D kernel;
+	data.user =3D user;
+	data.length =3D length;
+
+	req.type =3D CGEB_MSG_ALLOC;
+	req.code.length =3D length;
+	return cgeb_request(req, &resp, cgeb_after_alloc, &data);
+}
+
+static void __user *cgeb_user_alloc(size_t length)
+{
+	int ret;
+	struct cgeb_msg req =3D {0}, resp;
+	req.type =3D CGEB_MSG_ALLOC;
+	req.code.length =3D length;
+	ret =3D cgeb_request(req, &resp, NULL, NULL);
+	if (ret)
+		return NULL;
+
+	return resp.code.data;
+}
+
+static int cgeb_user_free(void __user *memory)
+{
+	struct cgeb_msg req =3D {0}, resp;
+
+	req.type =3D CGEB_MSG_FREE;
+	req.code.data =3D memory;
+	return cgeb_request(req, &resp, NULL, NULL);
+}
+
+/*
+ * cgeb_call - invoke CGEB BIOS call.
+ *
+ * @board:     board context data
+ * @p:         CGEB parameters for this call
+ * @fct:       CGEB function code
+ * @return:    0 on success or negative error code on failure.
+ *
+ * Call the CGEB BIOS code with the given parameters.
+ */
+int cgeb_call(struct cgeb_board_data *board,
+	      struct cgeb_function_parameters *p, cgeb_function_t fct)
+{
+	struct cgeb_fps *fps;
+	struct cgeb_msg req =3D {0}, resp;
+	struct cgeb_call_user user_data, user_data_clone;
+	int i;
+	int err;
+	void __user *iptr_user =3D NULL;
+	void __user *optr_user =3D NULL;
+
+	if ((p->optr && !p->optr_size) || (p->iptr && !p->iptr_size) ||
+	    (!p->optr && p->optr_size) || (!p->iptr && p->iptr_size)) {
+		pr_warn("CGEB: called with impossible iptr/optr\n");
+		return -EINVAL;
+	}
+
+	memset(&req, 0, sizeof(req));
+	fps =3D &req.fps.fps;
+
+	fps->size =3D sizeof(fps);
+	fps->fct =3D fct;
+	fps->data.off =3D board->data;
+	fps->data.seg =3D board->ds;
+	fps->data.pad =3D 0;
+	fps->status =3D 0;
+	fps->cont =3D fps->subfct =3D fps->subfps =3D 0;
+	fps->unit =3D p->unit;
+	for (i =3D 0; i < 4; i++)
+		fps->pars[i] =3D p->pars[i];
+	if (p->iptr) {
+		if (!p->iptr_size)
+			return -EINVAL;
+		err =3D cgeb_get_user_ptr(p->iptr, &iptr_user, p->iptr_size);
+		fps->iptr =3D iptr_user;
+		if (err)
+			return err;
+	}
+	req.fps.optr_size =3D p->optr_size;
+	user_data.optr =3D p->optr;
+	user_data.size =3D p->optr_size;
+
+	user_data.callback =3D p->callback;
+	user_data.callback_data =3D p->callback_data;
+
+	while (1) {
+		pr_debug("CGEB: CGEB: ->  size %02x, fct %02x, data %04x:%p\n",
+			 fps->size, fps->fct, fps->data.seg, fps->data.off);
+
+		user_data_clone =3D user_data;
+		req.type =3D CGEB_MSG_CALL;
+		req.fps.fps =3D *fps;
+		err =3D cgeb_request(req, &resp, cgeb_after_call,
+				   &user_data_clone);
+		if (err)
+			goto out;
+		if (resp.type !=3D CGEB_MSG_FPS) {
+			err =3D -EINVAL;
+			goto out;
+		}
+		fps =3D &resp.fps.fps;
+		/* Don't allocate another optr */
+		req.fps.optr_size =3D 0;
+
+		if (resp.fps.optr) {
+			optr_user =3D resp.fps.optr;
+		}
+
+		/* DBG_STR causes an allocation, don't overwrite our original */
+		if (fps->status !=3D CGEB_DBG_STR)
+			user_data =3D user_data_clone;
+
+		pr_debug("CGEB: CGEB: <-  size %02x, fct %02x, data %04x:%p\n",
+			 fps->size, fps->fct, fps->data.seg, fps->data.off);
+
+		switch (fps->status) {
+		case CGEB_SUCCESS:
+			goto out;
+		case CGEB_NEXT:
+			break;  /* simply call again */
+		case CGEB_NOIRQS:
+			__set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(0);
+			break;
+		case CGEB_DELAY:
+			usleep_range(fps->rets[0], fps->rets[0] + 1000);
+			break;
+		case CGEB_DBG_STR:
+			if (fps->optr) {
+				pr_debug("CGEB (dbg): %s\n", (char *)user_data_clone.optr);
+				kfree(user_data_clone.optr);
+			}
+			break;
+		case CGEB_DBG_HEX:
+			pr_debug("CGEB (dbg): 0x%08x\n", fps->rets[0]);
+			break;
+		case CGEB_DBG_DEC:
+			pr_debug("CGEB (dbg): %d\n", fps->rets[0]);
+			break;
+
+		default:
+			/* unknown continuation code */
+			err =3D -EINVAL;
+			goto out;
+		}
+	}
+out:
+	if (iptr_user)
+		cgeb_user_free(iptr_user);
+	if (optr_user)
+		cgeb_user_free(optr_user);
+	for (i =3D 0; i < 2; i++)
+		p->rets[i] =3D fps->rets[i];
+	p->optr =3D user_data.optr;
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(cgeb_call);
+
+/*
+ * cgeb_call_simple - convenience wrapper for cgeb_call
+ *
+ * @board:     board context data
+ * @p:         CGEB parameters for this call
+ * @fct:       CGEB function code
+ * @return:    0 on success or negative error code on failure.
+ *
+ * Call the CGEB BIOS code with the given parameters.
+ */
+int cgeb_call_simple(struct cgeb_board_data *board,
+		     cgeb_function_t fct, u32 unit,
+		     void *optr, size_t optr_size, u32 *result)
+{
+	struct cgeb_function_parameters p;
+	unsigned int ret;
+
+	memset(&p, 0, sizeof(p));
+	p.optr_size =3D optr_size;
+	p.unit =3D unit;
+	p.optr =3D optr;
+
+	ret =3D cgeb_call(board, &p, fct);
+
+	if (result)
+		*result =3D p.rets[0];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cgeb_call_simple);
+
+static void *cgeb_find_magic(void *_mem, size_t len, char *magic)
+{
+	u32 magic0 =3D ((u32 *)magic)[0];
+	u32 magic1 =3D ((u32 *)magic)[1];
+	int i =3D 0;
+
+	while (i < len) {
+		u32 *mem =3D _mem + i;
+
+		if (mem[0] =3D=3D magic0 && mem[1] =3D=3D magic1)
+			return mem;
+		i +=3D 16;
+	}
+
+	return NULL;
+}
+
+
+static int cgeb_overwrite_map(struct cgeb_msg *req, void *user)
+{
+	struct cgeb_board_data *board =3D (struct cgeb_board_data*) user;
+	struct cgeb_map_mem_list *pmm =3D board->map_mem;
+	int err;
+	err =3D copy_to_user(board->map_mem_user, board->map_mem,
+			   sizeof(pmm->entries[0]) * pmm->count + sizeof(*pmm));
+	if (err) {
+		pr_err("CGEB: Couldn't copy map_mem into userspace!\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static void cgeb_unmap_memory(struct cgeb_board_data *board)
+{
+	struct cgeb_map_mem_list *pmm;
+	struct cgeb_map_mem *pmme;
+	struct cgeb_msg req =3D {0}, res;
+	unsigned long i;
+
+	if (!board->map_mem)
+		return;
+
+	req.type =3D CGEB_MSG_MUNMAP;
+
+	pmm =3D board->map_mem;
+	pmme =3D pmm->entries;
+	pr_debug("CGEB: Unmapping %d pages\n", pmm->count);
+	for (i =3D 0; i < pmm->count; i++, pmme++) {
+		pmme->virt.seg =3D 0;
+		if (pmme->virt.off) {
+			req.code.data =3D pmme->virt.off;
+			req.code.length =3D pmme->size;
+			pmme->virt.off =3D 0;
+			cgeb_request(req, &res, cgeb_overwrite_map, board);
+		}
+	}
+	board->map_mem_user =3D NULL;
+	kfree(board->map_mem);
+}
+
+static int cgeb_deref_map(void __user *userspace, void *optr, void *user=
)
+{
+	struct cgeb_board_data *board =3D (struct cgeb_board_data*) user;
+	struct cgeb_map_mem_list *list =3D optr;
+	size_t size;
+	int uncopied;
+	size =3D sizeof(*list) + sizeof(list->entries[0]) * list->count;
+
+	board->map_mem =3D (struct cgeb_map_mem_list*) kzalloc(size, GFP_KERNEL=
);
+	if (!board->map_mem) {
+		pr_err("Couldn't allocate map_mem\n");
+		return -ENOMEM;
+	}
+
+	board->map_mem_user =3D userspace;
+	uncopied =3D copy_from_user(board->map_mem, board->map_mem_user, size);
+	if (uncopied) {
+		pr_err("Couldn't copy map_mem from map_mem_user!\n");
+		kfree(board->map_mem);
+		board->map_mem =3D NULL;
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+
+static int cgeb_map_memory(struct cgeb_board_data *board)
+{
+	struct cgeb_map_mem_list *pmm;
+	struct cgeb_map_mem *pmme;
+	struct cgeb_msg req =3D {0}, res;
+	struct cgeb_function_parameters fps =3D {0};
+	int i;
+	int ret;
+
+	fps.optr =3D &board->map_mem;
+	fps.optr_size =3D sizeof(*board->map_mem);
+	fps.callback =3D cgeb_deref_map;
+	fps.callback_data =3D board;
+	ret =3D cgeb_call(board, &fps, CgebMapGetMem);
+	if (ret)
+		return ret;
+
+	if (!board->map_mem)
+		return 0;
+
+	pmm =3D board->map_mem;
+	pmme =3D pmm->entries;
+
+	req.type =3D CGEB_MSG_MAP;
+
+	pr_debug("CGEB: Memory Map with %d entries\n", pmm->count);
+
+	for (i =3D 0; i < pmm->count; i++, pmme++) {
+		pr_debug("CGEB: Memory map entry phys=3D%p, size=3D%08x\n",
+				pmme->phys, pmme->size);
+		if (pmme->phys && pmme->size) {
+			/* We only want to look at the lower 32 bits */
+			req.map.phys =3D (size_t) pmme->phys & 0xffffffff;
+			req.map.size =3D pmme->size;
+			ret =3D cgeb_request(req, &res, NULL, NULL);
+			if (ret)
+				return ret;
+			if (res.type !=3D CGEB_MSG_MAPPED) {
+				pr_err("CGEB: Invalid map response!\n");
+				return -EINVAL;
+			}
+			pmme->virt.off =3D res.mapped.virt;
+		} else {
+			pmme->virt.off =3D 0;
+		}
+
+		pmme->virt.seg =3D (pmme->virt.off) ? board->ds : 0;
+
+		pr_debug("CGEB:   Map phys %p, size %08x, virt %04x:%p\n",
+			pmme->phys, pmme->size, pmme->virt.seg,
+			pmme->virt.off);
+	}
+
+	cgeb_request(req, &res, cgeb_overwrite_map, board);
+	return cgeb_call_simple(board, CgebMapChanged, 0, NULL, 0, NULL);
+}
+
+static void cgeb_munmap(void __user *ptr, size_t size)
+{
+	struct cgeb_msg req =3D {0}, res;
+
+	req.type =3D CGEB_MSG_MUNMAP;
+	req.code.data =3D ptr;
+	req.code.length =3D size;
+	cgeb_request(req, &res, NULL, NULL);
+}
+
+static struct cgeb_board_data *cgeb_open(resource_size_t base, u32 len)
+{
+	u32 dw;
+	struct cgeb_boardinfo pbi;
+	struct cgeb_low_desc *low_desc;
+	struct cgeb_high_desc *high_desc =3D NULL;
+	u32 high_desc_phys;
+	u32 high_desc_len;
+	void __iomem *pcur, *high_desc_virt;
+	int ret;
+
+	struct cgeb_board_data *board;
+
+	board =3D kzalloc(sizeof(*board), GFP_KERNEL);
+	if (!board)
+		return NULL;
+
+	pcur =3D ioremap_cache(base, len);
+	if (!pcur)
+		goto err_kfree;
+
+	/* look for the CGEB descriptor */
+	low_desc =3D cgeb_find_magic(pcur, len, CGEB_LD_MAGIC);
+	if (!low_desc)
+		goto err_kfree;
+
+	pr_debug("CGEB: Found CGEB_LD_MAGIC\n");
+
+	if (low_desc->size < sizeof(struct cgeb_low_desc) - sizeof(long))
+		goto err_kfree;
+
+	if (low_desc->size >=3D sizeof(struct cgeb_low_desc)
+			&& low_desc->hi_desc_phys_addr)
+		high_desc_phys =3D low_desc->hi_desc_phys_addr;
+	else
+		high_desc_phys =3D 0xfff00000;
+
+	high_desc_len =3D (unsigned int) -(int)high_desc_phys;
+
+	pr_debug("CGEB: Looking for CGEB hi desc between phys 0x%x and 0x%x\n",
+		high_desc_phys, -1);
+
+	high_desc_virt =3D ioremap_cache(high_desc_phys, high_desc_len);
+	if (!high_desc_virt)
+		goto err_kfree;
+
+	pr_debug("CGEB: Looking for CGEB hi desc between virt 0x%p and 0x%p\n",
+		high_desc_virt, high_desc_virt + high_desc_len - 1);
+
+	high_desc =3D cgeb_find_magic(high_desc_virt, high_desc_len,
+					CGEB_HD_MAGIC);
+	if (!high_desc)
+		goto err_iounmap;
+
+	pr_debug("CGEB: Found CGEB_HD_MAGIC\n");
+
+	if (high_desc->size < sizeof(struct cgeb_high_desc))
+		goto err_iounmap;
+
+	pr_debug("CGEB: data_size %u, code_size %u, entry_rel %u\n",
+		high_desc->data_size, high_desc->code_size, high_desc->entry_rel);
+
+	ret =3D cgeb_upload_code(high_desc, board);
+	if (ret) {
+		pr_err("CGEB: Couldn't upload code to helper: %d\n", ret);
+		goto err_munmap;
+	}
+
+	board->ds =3D get_data_segment();
+
+	ret =3D cgeb_call_simple(board, CgebGetCgebVersion, 0, NULL, 0, &dw);
+	if (ret)
+		goto err_munmap;
+
+	if (CGEB_GET_VERSION_MAJOR(dw) !=3D CGEB_VERSION_MAJOR)
+		goto err_munmap;
+
+	pr_debug("CGEB: BIOS interface revision: %d.%d\n",
+			dw >> 16, dw & 0xffff);
+
+	if (high_desc->data_size)
+		dw =3D high_desc->data_size;
+	else
+		ret =3D cgeb_call_simple(board, CgebGetDataSize, 0, NULL, 0, &dw);
+
+	if (!ret && dw) {
+		board->data =3D cgeb_user_alloc(high_desc->data_size);
+		if (!board->data)
+			goto err_munmap;
+	}
+
+	ret =3D cgeb_call_simple(board, CgebOpen, 0, NULL, 0, NULL);
+	if (ret)
+		goto err_free_data;
+
+	pr_debug("CGEB: Mapping memory\n");
+	ret =3D cgeb_map_memory(board);
+	if (ret)
+		goto err_free_map;
+	pr_debug("CGEB: Memory is mapped, getting board info\n");
+
+	ret =3D cgeb_call_simple(board, CgebBoardGetInfo, 0, &pbi,
+			       sizeof(pbi), NULL);
+	if (ret)
+		goto err_free_map;
+
+	pr_info("CGEB: Board name: %c%c%c%c\n",
+			pbi.board[0], pbi.board[1],
+			pbi.board[2], pbi.board[3]);
+
+	iounmap(high_desc_virt);
+
+	return board;
+
+err_free_map:
+	cgeb_unmap_memory(board);
+err_free_data:
+	cgeb_user_free(board->data);
+err_munmap:
+	cgeb_munmap(board->code, board->code_size);
+err_iounmap:
+	iounmap(high_desc_virt);
+err_kfree:
+	kfree(board);
+	return NULL;
+}
+
+static void cgeb_close(struct cgeb_board_data *board)
+{
+	cgeb_call_simple(board, CgebClose, 0, NULL, 0, NULL);
+
+	cgeb_unmap_memory(board);
+
+	cgeb_user_free(board->data);
+
+	cgeb_munmap(board->code, board->code_size);
+}
+
+static unsigned long cgeb_i2c_get_type(struct cgeb_board_data *brd, int =
unit)
+{
+	struct cgeb_i2c_info info;
+	int ret;
+
+	ret =3D cgeb_call_simple(brd, CgebI2CGetInfo, unit, &info,
+			       sizeof(info), NULL);
+	if (ret)
+		return ret;
+	return info.type;
+}
+
+static struct cgeb_board_data *cgeb_board;
+
+static int __init cgeb_init(void)
+{
+	struct cgeb_board_data *board;
+	resource_size_t base;
+	int i, ret, req;
+	struct cgeb_pdata pdata;
+	u32 i2c_count, watchdog_count;
+	int num_devices =3D 0;
+
+	for (req =3D 0; req < CGEB_REQUEST_MAX; ++req) {
+		init_completion(&cgeb_requests[req].done);
+	}
+
+	ret =3D cn_add_callback(&cgeb_cn_id, "cgeb", cgeb_cn_callback);
+	if (ret)
+		return ret;
+
+	pr_debug("CGEB: Opening board\n");
+	for (base =3D 0xf0000; base >=3D 0xc0000; base -=3D 0x10000) {
+		board =3D cgeb_open(base, 0x10000);
+		if (board)
+			break;
+	}
+
+	if (!board) {
+		ret =3D -ENODEV;
+		goto err_no_board;
+	}
+
+	cgeb_board =3D board;
+
+	pdata.board =3D board;
+
+	cgeb_call_simple(board, CgebI2CCount, 0, NULL, 0, &i2c_count);
+	cgeb_call_simple(board, CgebWDogCount, 0, NULL, 0, &watchdog_count);
+
+	board->num_devices =3D i2c_count + watchdog_count;
+	board->devices =3D kzalloc(sizeof(void *) * (board->num_devices),
+			 GFP_KERNEL);
+	if (!board->devices) {
+		ret =3D -ENOMEM;
+		goto err_out;
+	}
+
+	for (i =3D 0; i < i2c_count; i++) {
+		ret =3D cgeb_i2c_get_type(board, i);
+		if (ret !=3D CGEB_I2C_TYPE_PRIMARY)
+			continue;
+
+		 pdata.unit =3D i;
+
+		 board->devices[num_devices] =3D
+			platform_device_register_data(NULL, "cgeb-i2c", i,
+					&pdata, sizeof(pdata));
+		 num_devices++;
+	}
+
+	for (i =3D 0; i < watchdog_count; i++) {
+		board->devices[num_devices] =3D
+			platform_device_register_data(NULL, "cgeb-watchdog", i,
+					&pdata, sizeof(pdata));
+		pdata.unit =3D i;
+
+		num_devices++;
+	}
+
+	return 0;
+err_out:
+	cgeb_close(board);
+	kfree(board);
+
+err_no_board:
+	cn_del_callback(&cgeb_cn_id);
+
+	return ret;
+}
+
+static void __exit cgeb_exit(void)
+{
+	struct cgeb_board_data *board =3D cgeb_board;
+	int i;
+
+	for (i =3D 0; i < board->num_devices; i++)
+		if (board->devices[i])
+			platform_device_unregister(board->devices[i]);
+
+	cgeb_close(board);
+
+	kfree(board->devices);
+	kfree(board);
+	cn_del_callback(&cgeb_cn_id);
+}
+
+module_init(cgeb_init);
+module_exit(cgeb_exit);
+
+MODULE_AUTHOR("Mary Strodl <mstrodl@csh.rit.edu>");
+MODULE_DESCRIPTION("CGEB driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/congatec-cgeb.h b/include/linux/mfd/congat=
ec-cgeb.h
new file mode 100644
index 000000000000..47b594cc557b
--- /dev/null
+++ b/include/linux/mfd/congatec-cgeb.h
@@ -0,0 +1,111 @@
+#ifndef __CONGATEC_CGEB_H
+#define __CONGATEC_CGEB_H
+
+/* CGEB interface functions */
+typedef enum {
+	CgebGetCgebVersion =3D            0,
+	CgebGetSysBiosVersion =3D         1,
+	CgebGetVgaBiosVersion =3D         2,
+	CgebGetDataSize =3D               3,
+	CgebOpen =3D                      4,
+	CgebClose =3D                     5,
+	CgebMapGetMem =3D                 6,
+	CgebMapChanged =3D                7,
+	CgebMapGetPorts =3D               8,
+	CgebDelayUs =3D                   9,
+	CgebCgbcReadWrite =3D             10,
+	CgebCgbcSetControl =3D            11,
+	CgebCgbcGetInfo =3D               12,
+	CgebCgbcHandleCommand =3D         13,
+	CgebBoardGetInfo =3D              14,
+	CgebBoardGetBootCounter =3D       15,
+	CgebBoardGetRunningTimeMeter =3D  16,
+	CgebBoardGetBootErrorLog =3D      17,
+	CgebVgaCount =3D                  18,
+	CgebVgaGetInfo =3D                19,
+	CgebVgaGetContrast =3D            20,
+	CgebVgaSetContrast =3D            21,
+	CgebVgaGetContrastEnable =3D      22,
+	CgebVgaSetContrastEnable =3D      23,
+	CgebVgaGetBacklight =3D           24,
+	CgebVgaSetBacklight =3D           25,
+	CgebVgaGetBacklightEnable =3D     26,
+	CgebVgaSetBacklightEnable =3D     27,
+	CgebVgaEndDarkBoot =3D            28,
+	CgebStorageAreaCount =3D          29,
+	CgebStorageAreaGetInfo =3D        30,
+	CgebStorageAreaRead =3D           31,
+	CgebStorageAreaWrite =3D          32,
+	CgebStorageAreaErase =3D          33,
+	CgebStorageAreaEraseStatus =3D    34,
+	CgebI2CCount =3D                  35,
+	CgebI2CGetInfo =3D                36,
+	CgebI2CGetAddrList =3D            37,
+	CgebI2CTransfer =3D               38,
+	CgebI2CGetFrequency =3D           39,
+	CgebI2CSetFrequency =3D           40,
+	CgebIOCount =3D                   41,
+	CgebIOGetInfo =3D                 42,
+	CgebIORead =3D                    43,
+	CgebIOWrite =3D                   44,
+	CgebIOGetDirection =3D            45,
+	CgebIOSetDirection =3D            46,
+	CgebWDogCount =3D                 47,
+	CgebWDogGetInfo =3D               48,
+	CgebWDogTrigger =3D               49,
+	CgebWDogGetConfig =3D             50,
+	CgebWDogSetConfig =3D             51,
+	CgebPerformanceGetCurrent =3D     52,
+	CgebPerformanceSetCurrent =3D     53,
+	CgebPerformanceGetPolicyCaps =3D  54,
+	CgebPerformanceGetPolicy =3D      55,
+	CgebPerformanceSetPolicy =3D      56,
+	CgebTemperatureCount =3D          57,
+	CgebTemperatureGetInfo =3D        58,
+	CgebTemperatureGetCurrent =3D     59,
+	CgebTemperatureSetLimits =3D      60,
+	CgebFanCount =3D                  61,
+	CgebFanGetInfo =3D                62,
+	CgebFanGetCurrent =3D             63,
+	CgebFanSetLimits =3D              64,
+	CgebVoltageCount =3D              65,
+	CgebVoltageGetInfo =3D            66,
+	CgebVoltageGetCurrent =3D         67,
+	CgebVoltageSetLimits =3D          68,
+	CgebStorageAreaLock =3D           69,
+	CgebStorageAreaUnlock =3D         70,
+	CgebStorageAreaIsLocked =3D       71,
+} cgeb_function_t;
+
+struct cgeb_function_parameters {
+	u32 unit;               /* unit number or type */
+	u32 pars[4];            /* input parameters */
+	u32 rets[2];            /* return parameters */
+	void *iptr;             /* input pointer */
+	void *optr;             /* output pointer */
+	size_t iptr_size;       /* size of input pointer */
+	size_t optr_size;       /* size of output pointer */
+	void *callback_data;    /* callback data pointer */
+	int (*callback)(void __user *, void *, void *);
+				/* Run when CGEB call finishes with userspace */
+				/* optr, kernel optr, and callback_data */
+};
+
+struct cgeb_board_data;
+
+int cgeb_call(struct cgeb_board_data *,
+		struct cgeb_function_parameters *, cgeb_function_t);
+
+int cgeb_call_simple(struct cgeb_board_data *,
+		cgeb_function_t, u32,
+		void *, size_t size, u32 *);
+
+/*
+ * Platform data for child devices
+ */
+struct cgeb_pdata {
+	struct cgeb_board_data *board;
+	int unit;
+};
+
+#endif /* __CONGATEC_CGEB_H */
diff --git a/include/uapi/linux/connector.h b/include/uapi/linux/connecto=
r.h
index 5ae131c3f145..f64862bee5ce 100644
--- a/include/uapi/linux/connector.h
+++ b/include/uapi/linux/connector.h
@@ -47,9 +47,11 @@
 #define CN_KVP_VAL			0x1	/* queries from the kernel */
 #define CN_VSS_IDX			0xA     /* HyperV VSS */
 #define CN_VSS_VAL			0x1     /* queries from the kernel */
+#define CN_IDX_CGEB			0xB	/* congatec CGEB */
+#define CN_VAL_CGEB			0x1
=20
=20
-#define CN_NETLINK_USERS		11	/* Highest index + 1 */
+#define CN_NETLINK_USERS		12	/* Highest index + 1 */
=20
 /*
  * Maximum connector's message size.
--=20
2.45.2


