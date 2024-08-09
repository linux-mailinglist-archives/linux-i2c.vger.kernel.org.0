Return-Path: <linux-i2c+bounces-5233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43A94C7C2
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 02:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71DA2873F1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 00:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FFB2F26;
	Fri,  9 Aug 2024 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h19eCIYf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE3838C;
	Fri,  9 Aug 2024 00:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723164411; cv=none; b=qDx95VefCtXW3ZYm2THAbgg/Ls3ETdIlxl1B5EvIDuJBXtSN1PyfWACFJXNtnuskfQDPDSbjbXm0JcgrD3l5l5wzlOQv4WlWm/BmTLxRh3KgXLdmtBnJkBtubOuM9repODB7B8QOGdBSRUzwVGJVrGnkPWscLNQsQ3eJUVKlBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723164411; c=relaxed/simple;
	bh=BHjbX0h4gBwPHoOJpcfLmYzC7Vazky3omT+txTF+jXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzMcfUmjFdPVDAyjRwNp4SM4JJAvlar8yELeJg3t70QzEqxcewvuszjaMZXPKH+u6qihotw1jBviDSZ72OZij1r0xrpGKJRusuSnQ4XrEC6wbSdRW/FSn1Uzj3/7Z29OhXNFSx4oUX3K0lLwqnm3OEHhVHdvkK92ywlmbgVunJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h19eCIYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5D1C32782;
	Fri,  9 Aug 2024 00:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723164410;
	bh=BHjbX0h4gBwPHoOJpcfLmYzC7Vazky3omT+txTF+jXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h19eCIYf1rulkzzHu5RhJHo0Qbgg+8pXndGVFg3Yym85KnKcXgDoOgFleAYZnzaFF
	 2p5zh+VjNGiGjx9Sltsabp6E2bFcFMGjYQP3rTp78Y67VNb+V+vmG4oW0fcYuldiKb
	 7ds3BDvKdvJmUYCrHkU9NEp++drZzMUnZMYHjcFvZjEBqRhjR2mn6inN8p9cngGkU5
	 uLHloeSqTVQJTEoJkvTVOZUiYfu2PV0Y3YYWN+w77bBqOdVREWCWvnShExhC+GRS+n
	 MYbwIgo2M518Mjis6UjK8q6HPL/n5jpJVlJdfSOFNx1sUn/qX9qwI2xiTJUOMYBDox
	 TA3SfNmOCbN7g==
Date: Fri, 9 Aug 2024 01:46:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, lee@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v3 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <ft2lkhphs25xmvmpbf5ssuafdnmkdnq5j7uqb6jjy6ewnwzn2l@6uoad3ii3h4m>
References: <20240808183527.3950120-1-mstrodl@csh.rit.edu>
 <20240808183527.3950120-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808183527.3950120-2-mstrodl@csh.rit.edu>

Hi Mary,

...

> --- /dev/null
> +++ b/drivers/mfd/congatec-cgeb.c
> @@ -0,0 +1,1138 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * CGEB driver
> + *
> + * Copyright (c) 2024 Mary Strodl
> + *
> + * Based on code from Congatec AG and Sascha Hauer
> + *
> + * CGEB is a BIOS interface found on congatech modules. It consists of
> + * code found in the BIOS memory map which is called in a ioctl like
> + * fashion. This file contains the basic driver for this interface
> + * which provides access to the GCEB interface and registers the child
> + * devices like I2C busses and watchdogs.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

If you use the SPDX identifier you don't need to mention the GPL
parts here.

> + */
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/io.h>
> +#include <linux/string.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +#include <linux/mm.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/connector.h>
> +#include <linux/mfd/congatec-cgeb.h>
> +#include <linux/completion.h>
> +
> +#include <generated/autoconf.h>

the include files are normally alphabetically sorted.

> +#pragma pack(push, 4)
> +
> +struct cgeb_low_desc {
> +	char magic[8];          /* descriptor magic string */
> +	u16 size;               /* size of this descriptor */
> +	u16 reserved;
> +	char bios_name[8];      /* BIOS name and revision "ppppRvvv" */
> +	u32 hi_desc_phys_addr;  /* phys addr of the high descriptor, can be 0 */
> +};
> +
> +/* CGEB High Descriptor located in 0xfff00000-0xffffffff */
> +#ifdef CONFIG_X86_64
> +#define CGEB_HD_MAGIC "$CGEBQD$"
> +#else
> +#define CGEB_HD_MAGIC "$CGEBHD$"
> +#endif
> +
> +struct cgeb_high_desc {
> +	char magic[8];          /* descriptor magic string */
> +	u16 size;               /* size of this descriptor */
> +	u16 reserved;
> +	u32 data_size;          /* CGEB data area size */
> +	u32 code_size;          /* CGEB code area size */
> +	u32 entry_rel;          /* CGEB entry point relative to start */
> +};
> +
> +struct cgeb_far_ptr {
> +	void __user *off;
> +	u16 seg;
> +	u16 pad;
> +};
> +
> +struct cgeb_fps {
> +	u32 size;               /* size of the parameter structure */
> +	u32 fct;                /* function number */
> +	struct cgeb_far_ptr data;       /* CGEB data area */
> +	void __user *cont;      /* private continuation pointer */
> +	void __user *subfps;    /* private sub function parameter
> +				 * structure pointer
> +				 */
> +	void __user *subfct;    /* sub function pointer */
> +	u32 status;             /* result codes of the function */
> +	u32 unit;               /* unit number or type */
> +	u32 pars[4];            /* input parameters */
> +	u32 rets[2];            /* return parameters */
> +	void __user *iptr;      /* input pointer */
> +	void __user *optr;      /* output pointer */
> +};

...

> +struct cgeb_map_mem {
> +	void *phys;             /* physical address */
> +	u32 size;               /* size in bytes */
> +	struct cgeb_far_ptr virt;
> +};
> +
> +struct cgeb_map_mem_list {
> +	u32 count;              /* number of memory map entries */
> +	struct cgeb_map_mem entries[];
> +};
> +
> +struct cgeb_boardinfo {
> +	u32 size;
> +	u32 flags;
> +	u32 classes;
> +	u32 primary_class;
> +	char board[CGOS_BOARD_MAX_SIZE_ID_STRING];
> +	/* optional */
> +	char vendor[CGOS_BOARD_MAX_SIZE_ID_STRING];
> +};
> +
> +struct cgeb_i2c_info {
> +	u32 size;
> +	u32 type;
> +	u32 frequency;
> +	u32 maxFrequency;
> +};

...

> +struct cgeb_board_data {
> +	void __user *data;
> +	void __user *code;
> +	size_t code_size;
> +	u16 ds;
> +	struct cgeb_map_mem_list *map_mem;
> +	void __user *map_mem_user;
> +	struct platform_device **devices;
> +	int num_devices;
> +
> +	#ifdef CONFIG_X86_64
> +	void (*entry)(void*, struct cgeb_fps *, struct cgeb_fps *, void*);
> +	#else
> +	/*
> +	 * entry points to a bimodal C style function that expects a far pointer
> +	 * to a fps. If cs is 0 then it does a near return, otherwise a far
> +	 * return. If we ever need a far return then we must not pass cs at all.
> +	 * parameters are removed by the caller.
> +	 */
> +	void __attribute__((regparm(0)))(*entry)(unsigned short,
> +			  struct cgeb_fps *, unsigned short);
> +	#endif
> +};
> +
> +struct cgeb_call_user {
> +	void *optr;
> +	size_t size;
> +	void *callback_data;
> +	int (*callback)(void __user *optr, void *koptr, void *data);
> +};
> +
> +enum cgeb_msg_type {
> +	CGEB_MSG_ACK = 0,
> +	CGEB_MSG_ERROR,
> +	CGEB_MSG_FPS,
> +	CGEB_MSG_MAPPED,
> +	CGEB_MSG_MAP,
> +	CGEB_MSG_CODE,
> +	CGEB_MSG_ALLOC,
> +	CGEB_MSG_ALLOC_CODE,
> +	CGEB_MSG_FREE,
> +	CGEB_MSG_MUNMAP,
> +	CGEB_MSG_CALL,
> +	CGEB_MSG_PING,
> +};
> +
> +struct cgeb_msg {
> +	enum cgeb_msg_type type;
> +	union {
> +		struct cgeb_msg_mapped {
> +			void __user *virt;
> +		} mapped;
> +		struct cgeb_msg_fps {
> +			size_t optr_size;
> +			void __user *optr;
> +			struct cgeb_fps fps;
> +		} fps;
> +		struct cgeb_msg_code {
> +			size_t length;
> +			uint32_t entry_rel;
> +			void __user *data;
> +		} code;
> +		struct cgeb_msg_map {
> +			uint32_t phys;
> +			size_t size;
> +		} map;
> +	};
> +};
> +
> +static char cgeb_helper_path[PATH_MAX] = "/sbin/cgeb-helper";
> +
> +static struct cb_id cgeb_cn_id = {
> +	.idx = CN_IDX_CGEB,
> +	.val = CN_VAL_CGEB
> +};
> +
> +enum cgeb_request_state {
> +	CGEB_REQ_IDLE = 0,
> +	CGEB_REQ_ACTIVE,
> +	CGEB_REQ_DONE,
> +};
> +
> +static DEFINE_MUTEX(cgeb_lock);
> +struct cgeb_request {
> +	struct completion done;
> +	struct cgeb_msg *out;
> +	enum cgeb_request_state busy;
> +	int ack;
> +	int (*callback)(struct cgeb_msg *msg, void *user);
> +	void *user;
> +};
> +
> +#define CGEB_REQUEST_MAX 16
> +static struct cgeb_request cgeb_requests[CGEB_REQUEST_MAX];
> +
> +struct cgeb_after_alloc_data {
> +	void *kernel;
> +	void __user **user;
> +	size_t length;
> +};
> +
> +struct cgeb_map_data {
> +	void __user *user_list;
> +	struct cgeb_board_data *board;
> +};

I'm counting too many global variables here and too many global
structure definitions. It might get a bit hard to follow.

I'd suggest to simplify this part as much as possible and keep
everything in as less structures as possible (ideally just one). 

Please make local as many variables as you can.

...

> +static int cgeb_request(struct cgeb_msg msg, struct cgeb_msg *out,
> +			int (*callback)(struct cgeb_msg*, void*), void *user)
> +{

...

> +	if (req->busy) {
> +		mutex_unlock(&cgeb_lock);
> +		err = -EBUSY;
> +		goto out;

just return -EBUSY

> +	}
> +	wrapper->seq = seq;
> +	req->busy = CGEB_REQ_ACTIVE;
> +	req->ack = wrapper->ack;
> +	req->out = out;
> +	req->callback = callback;
> +	req->user = user;
> +
> +	err = cn_netlink_send(wrapper, 0, 0, GFP_KERNEL);
> +	if (err == -ESRCH) {
> +		err = cgeb_helper_start();
> +		if (err) {
> +			pr_err("failed to execute %s\n", cgeb_helper_path);
> +			pr_err("make sure the cgeb helper is executable\n");
> +		} else {
> +			do {
> +				err = cn_netlink_send(wrapper, 0, 0,
> +						      GFP_KERNEL);
> +				if (err == -ENOBUFS)
> +					err = 0;
> +				if (err == -ESRCH)
> +					msleep(30);
> +			} while (err == -ESRCH && ++retries < 5);

when you use constants like "5", you need to give it an
explanation, either as a define (the name speaks by itself) or a
comment. We don't want people asking "why 5?" :-)

> +		}
> +	} else if (err == -ENOBUFS)
> +		err = 0;

based on the coding style this should have been:

	if (err == -ESRCH) {
		...
	} else if (err == -ENOBUFS) {
		err = 0;
	}

You either use brackets for every if/else/else fi or for no one.

> +	kfree(wrapper);
> +
> +	if (++seq >= CGEB_REQUEST_MAX)
> +		seq = 0;
> +
> +	mutex_unlock(&cgeb_lock);
> +
> +	if (err)
> +		goto out;

just return err

> +
> +	/* Wait for a response to the request */
> +	err = wait_for_completion_interruptible_timeout(
> +		&req->done, msecs_to_jiffies(20000));
> +	if (err == 0) {
> +		pr_err("CGEB: Timed out running request of type %d!\n",
> +		       msg.type);
> +		err = -ETIMEDOUT;

just "return -ETIMEDOUT;" and you can cleanup the code below

> +	} else if (err > 0)
> +		err = 0;

brackets!

> +	if (err)
> +		goto out;
> + 
> +	mutex_lock(&cgeb_lock);
> +
> +	if (req->busy != CGEB_REQ_DONE) {
> +		pr_err("CGEB: BUG: Request is in a bad state?\n");
> +		err = -EINVAL;
> +	}
> +
> +	req->busy = CGEB_REQ_IDLE;
> +	mutex_unlock(&cgeb_lock);
> +out:
> +	return err;

I don't see any need for the out: label

> +}
> +
> +static void cgeb_cn_callback(struct cn_msg *msg, struct netlink_skb_parms *nsp)
> +{
> +	struct cgeb_request *req;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return;
> +
> +	if (msg->seq >= CGEB_REQUEST_MAX) {
> +		pr_err("CGEB: Impossible sequence number: %d! Ignoring\n",
> +		       msg->seq);
> +		return;
> +	}
> +
> +	mutex_lock(&cgeb_lock);
> +	req = &cgeb_requests[msg->seq];
> +
> +	if (!req->busy || req->ack != msg->ack) {
> +		pr_err("CGEB: Bad response to request %d! Ignoring\n",
> +		       msg->seq);
> +		mutex_unlock(&cgeb_lock);
> +		return;
> +	}
> +
> +	if (msg->len != sizeof(*req->out)) {
> +		pr_err("CGEB: Bad response size for request %d!\n", msg->seq);
> +		mutex_unlock(&cgeb_lock);
> +		return;

here it can be useful to have a goto statement:

	goto out;
	...
	out:
		mutex_unlock(...);
		return;

Andi

