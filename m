Return-Path: <linux-i2c+bounces-5013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D526D9345B9
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FED01F2270B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 01:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FBF12E7F;
	Thu, 18 Jul 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="DTUhhYHx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B5394;
	Thu, 18 Jul 2024 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721265924; cv=none; b=nqX8H7tewSQrQu9oZZko/P4X3am1G+v7m1LoJiyhsTCp+VeTF3yS49/CM8ZhlD3HehmaIrjokhEINM8qjsBgg6mnDyn4JnVoo3dvSuovBTIRQTNotDt0ILCEFQx2eeG8lBOSVsIHWP1KRoVHKbmTgiG38wTKCmeiIP+l2FW0nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721265924; c=relaxed/simple;
	bh=eKiKIc7r4fIMSIrignuV6KeMy7ZtUyOD6QPxWWr2G3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnnKl9surCAI1YKRyHPqHWaIu9frOVaPop7eSbLsN0v5kEuzVkcFNzuJ6IdS3SSxEhbw+paZm8ap2hlGII5lcu1N9IdnKJ71IT39jMdfO4ScD/tlX4iagUKplMS6uGEGZEkRnq2S5kyrn7wXDs/VjuBxrBP3gOXU3k81BHSUz6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=DTUhhYHx; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 3C36B456D905;
	Wed, 17 Jul 2024 21:16:20 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1721265379; x=1723079780; bh=eKiKI
	c7r4fIMSIrignuV6KeMy7ZtUyOD6QPxWWr2G3c=; b=DTUhhYHx6zQU1nx1Aj67r
	N4cSJJ82DBuBHRMI6r5TjHh/APHvF4x1Sok0+1OcO2KyInzSA1fNomXx7XhUtzpX
	JqgwdibxvHGXaAcfm/KgYPS3DU/EwhKSwK6QrjUNLlthBe+d/OcfWzzhFDozHJkB
	Oy1OW3TkEUb6xT9WpnSUQU=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eyE6XJisN_wM; Wed, 17 Jul 2024 21:16:19 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id F0FC6456E197;
	Wed, 17 Jul 2024 21:16:18 -0400 (EDT)
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
Subject: [PATCH 2/3] x86: Add basic support for the Congatec CGEB BIOS interface
Date: Wed, 17 Jul 2024 21:15:03 -0400
Message-ID: <20240718011504.4106163-3-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sascha Hauer <s.hauer@pengutronix.de>

The Congatec CGEB is a BIOS interface found on some Congatec x86
modules. It provides access to on board peripherals like I2C busses
and watchdogs. This driver contains the basic support for accessing
the CGEB interface and registers the child devices.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/mfd/Kconfig               |  10 +
 drivers/mfd/Makefile              |   1 +
 drivers/mfd/congatec-cgeb.c       | 620 ++++++++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h | 105 +++++
 4 files changed, 736 insertions(+)
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
index 000000000000..2bae1f42c357
--- /dev/null
+++ b/drivers/mfd/congatec-cgeb.c
@@ -0,0 +1,620 @@
+/*
+ * CGEB driver
+ *
+ * (c) 2011 Sascha Hauer, Pengutronix
+ *
+ * Based on code from Congatec AG.
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
+#include <linux/version.h>
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
+#include <linux/mfd/congatec-cgeb.h>
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
+	void* off;
+	u16 seg;
+	u16 pad;
+};
+
+struct cgeb_fps {
+	u32 size;               /* size of the parameter structure */
+	u32 fct;                /* function number */
+	struct cgeb_far_ptr data;       /* CGEB data area */
+	void* cont;             /* private continuation pointer */
+	void* subfps;           /* private sub function parameter
+				 * structure pointer
+				 */
+	void* subfct;           /* sub function pointer */
+	u32 status;             /* result codes of the function */
+	u32 unit;               /* unit number or type */
+	u32 pars[4];            /* input parameters */
+	u32 rets[2];            /* return parameters */
+	void *iptr;             /* input pointer */
+	void *optr;             /* output pointer */
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
+	void* phys;             /* physical address */
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
+	void *code;
+	void *data;
+	u16 ds;
+	struct cgeb_map_mem_list *map_mem;
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
+unsigned int cgeb_call(struct cgeb_board_data *board,
+		 struct cgeb_function_parameters *p, cgeb_function_t fct)
+{
+	struct cgeb_fps fps;
+	int i;
+
+	memset(&fps, 0, sizeof(fps));
+
+	fps.size =3D sizeof(fps);
+	fps.fct =3D fct;
+	fps.data.off =3D board->data;
+	fps.data.seg =3D board->ds;
+	fps.data.pad =3D 0;
+	fps.status =3D 0;
+	fps.cont =3D fps.subfct =3D fps.subfps =3D 0;
+	fps.unit =3D p->unit;
+	for (i =3D 0; i < 4; i++)
+		fps.pars[i] =3D p->pars[i];
+	fps.iptr =3D p->iptr;
+	fps.optr =3D p->optr;
+
+	while (1) {
+		pr_debug("CGEB: CGEB: ->  size %02x, fct %02x, data %04x:%p, status %0=
8x\n",
+				fps.size, fps.fct, fps.data.seg, fps.data.off,
+				fps.status);
+
+#ifdef CONFIG_X86_64
+		board->entry(NULL, &fps, &fps, NULL);
+#else
+		board->entry(0, &fps, fps.data.seg);
+#endif
+
+		pr_debug("CGEB: CGEB: <-  size %02x, fct %02x, data %04x:%p, status %0=
8x\n",
+				fps.size, fps.fct, fps.data.seg, fps.data.off,
+				fps.status);
+
+		switch (fps.status) {
+		case CGEB_SUCCESS:
+			goto out;
+		case CGEB_NEXT:
+			break;  /* simply call again */
+		case CGEB_NOIRQS:
+			__set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(0);
+			break;
+		case CGEB_DELAY:
+			usleep_range(fps.rets[0], fps.rets[0] + 1000);
+			break;
+		case CGEB_DBG_STR:
+			if (fps.optr)
+				pr_debug("CGEB: %s\n", (char *)fps.optr);
+			break;
+		case CGEB_DBG_HEX:
+			pr_debug("CGEB: 0x%08x\n", fps.rets[0]);
+			break;
+		case CGEB_DBG_DEC:
+			pr_debug("CGEB: %d\n", fps.rets[0]);
+			break;
+
+		default:
+			/* unknown continuation code */
+			return -EINVAL;
+		}
+	}
+out:
+	for (i =3D 0; i < 2; i++)
+		p->rets[i] =3D fps.rets[i];
+	p->optr =3D fps.optr;
+
+	return 0;
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
+		 cgeb_function_t fct, u32 unit,
+		 void **optr, u32 *result)
+{
+	struct cgeb_function_parameters p;
+	unsigned int ret;
+
+	memset(&p, 0, sizeof(p));
+	p.unit =3D unit;
+	p.optr =3D optr;
+
+	ret =3D cgeb_call(board, &p, fct);
+	if (optr)
+		*optr =3D p.optr;
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
+static void cgeb_unmap_memory(struct cgeb_board_data *board)
+{
+	struct cgeb_map_mem_list *pmm;
+	struct cgeb_map_mem *pmme;
+	unsigned long i;
+
+	if (!board->map_mem)
+		return;
+
+	pmm =3D board->map_mem;
+	pmme =3D pmm->entries;
+	for (i =3D 0; i < pmm->count; i++, pmme++) {
+		if (pmme->virt.off)
+			iounmap((void *)pmme->virt.off);
+		pmme->virt.off =3D 0;
+		pmme->virt.seg =3D 0;
+	}
+}
+
+static int cgeb_map_memory(struct cgeb_board_data *board)
+{
+	struct cgeb_map_mem_list *pmm;
+	struct cgeb_map_mem *pmme;
+	int i;
+	int ret;
+
+	ret =3D cgeb_call_simple(board, CgebMapGetMem, 0, (void *)&board->map_m=
em,
+			NULL);
+	if (ret)
+		return ret;
+	if (!board->map_mem)
+		return 0;
+
+	pmm =3D board->map_mem;
+	pmme =3D pmm->entries;
+
+	pr_debug("CGEB: Memory Map with %d entries\n", pmm->count);
+
+	for (i =3D 0; i < pmm->count; i++, pmme++) {
+		pr_debug("CGEB: Memory map entry phys=3D%px, size=3D%08x\n",
+				pmme->phys, pmme->size);
+		if (pmme->phys && pmme->size) {
+			/* We only want to look at the lower 32 bits */
+			pmme->virt.off =3D
+				ioremap_cache((u32)(resource_size_t)pmme->phys,
+					pmme->size);
+			if (!pmme->virt.off)
+				return -ENOMEM;
+		 } else {
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
+	return cgeb_call_simple(board, CgebMapChanged, 0, NULL, NULL);
+}
+
+static struct cgeb_board_data *cgeb_open(resource_size_t base, u32 len)
+{
+	u32 dw;
+	struct cgeb_boardinfo *pbi;
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
+	board->code =3D __vmalloc_node_range(high_desc->code_size, 1,
+					   VMALLOC_START, VMALLOC_END,
+					   GFP_KERNEL, PAGE_KERNEL_EXEC,
+					   (VM_WRITE | VM_EXEC), NUMA_NO_NODE,
+					   __builtin_return_address(0));
+	if (!board->code)
+		goto err_iounmap;
+
+	memcpy(board->code, high_desc, high_desc->code_size);
+
+	high_desc =3D board->code;
+
+	board->entry =3D (void*)((char*)board->code + high_desc->entry_rel);
+
+	board->ds =3D get_data_segment();
+
+	ret =3D cgeb_call_simple(board, CgebGetCgebVersion, 0, NULL, &dw);
+	if (ret)
+		goto err_vfree;
+
+	if (CGEB_GET_VERSION_MAJOR(dw) !=3D CGEB_VERSION_MAJOR)
+		goto err_vfree;
+
+	pr_debug("CGEB: BIOS interface revision: %d.%d\n",
+			dw >> 16, dw & 0xffff);
+
+	if (high_desc->data_size) {
+		board->data =3D vmalloc(high_desc->data_size);
+		if (!board->data)
+			goto err_vfree;
+	} else {
+		 ret =3D cgeb_call_simple(board, CgebGetDataSize, 0, NULL, &dw);
+		 if (!ret && dw) {
+			board->data =3D vmalloc(dw);
+			if (!board->data)
+				goto err_vfree;
+		}
+	}
+
+	ret =3D cgeb_call_simple(board, CgebOpen, 0, NULL, NULL);
+	if (ret)
+		goto err_vfree_data;
+
+	ret =3D cgeb_map_memory(board);
+	if (ret)
+		goto err_free_map;
+
+	ret =3D cgeb_call_simple(board, CgebBoardGetInfo, 0, (void*)&pbi, NULL)=
;
+	if (ret)
+		goto err_free_map;
+
+	pr_info("CGEB: Board name: %c%c%c%c\n",
+			pbi->board[0], pbi->board[1],
+			pbi->board[2], pbi->board[3]);
+
+	iounmap(high_desc_virt);
+
+	return board;
+
+err_free_map:
+	cgeb_unmap_memory(board);
+err_vfree_data:
+	vfree(board->data);
+err_vfree:
+	vfree(board->code);
+err_iounmap:
+	iounmap(high_desc_virt);
+err_kfree:
+	kfree(board);
+	return NULL;
+}
+
+static void cgeb_close(struct cgeb_board_data *board)
+{
+	cgeb_call_simple(board, CgebClose, 0, NULL, NULL);
+
+	cgeb_unmap_memory(board);
+
+	vfree(board->data);
+	vfree(board->code);
+}
+
+static unsigned long cgeb_i2c_get_type(struct cgeb_board_data *brd, int =
unit)
+{
+	struct cgeb_i2c_info *info;
+	int ret;
+
+	ret =3D cgeb_call_simple(brd, CgebI2CGetInfo, unit, (void *) &info, NUL=
L);
+	if (ret)
+		return ret;
+	if (!info)
+		return -EINVAL;
+	return info->type;
+}
+
+static struct cgeb_board_data *cgeb_board;
+
+static int __init cgeb_init(void)
+{
+	struct cgeb_board_data *board;
+	resource_size_t base;
+	int i, ret;
+	struct cgeb_pdata pdata;
+	u32 i2c_count, watchdog_count;
+	int num_devices =3D 0;
+
+	for (base =3D 0xf0000; base >=3D 0xc0000; base -=3D 0x10000) {
+		board =3D cgeb_open(base, 0x10000);
+		if (board)
+			break;
+	}
+
+	if (!board)
+		return -ENODEV;
+
+	cgeb_board =3D board;
+
+	pdata.board =3D board;
+
+	cgeb_call_simple(board, CgebI2CCount, 0, NULL, &i2c_count);
+	cgeb_call_simple(board, CgebWDogCount, 0, NULL, &watchdog_count);
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
+}
+
+module_init(cgeb_init);
+module_exit(cgeb_exit);
+
+MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
+MODULE_DESCRIPTION("CGEB driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/congatec-cgeb.h b/include/linux/mfd/congat=
ec-cgeb.h
new file mode 100644
index 000000000000..26f5452286af
--- /dev/null
+++ b/include/linux/mfd/congatec-cgeb.h
@@ -0,0 +1,105 @@
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
+};
+
+struct cgeb_board_data;
+
+unsigned int cgeb_call(struct cgeb_board_data *,
+		struct cgeb_function_parameters *, cgeb_function_t);
+
+int cgeb_call_simple(struct cgeb_board_data *,
+		cgeb_function_t, u32,
+		void **, u32 *);
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
--=20
2.45.2


