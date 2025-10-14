Return-Path: <linux-i2c+bounces-13472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3EBD77FD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 07:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E2061920A2E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 05:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED102BEC27;
	Tue, 14 Oct 2025 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AoNNOTWj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4D305078
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421294; cv=none; b=SUbMW3NdhgcCVQ9DK6/jLiCNOyQ6ykAIAJrNf3HBFmzMVHGP7PJv3TeFXu7UdY+Br0CYaE9aPoPizbqxt6zVhFeyMzbm7M1M+2N93i+NbkpUxIv9DnDKaX3DzVXvkzeBJTBRHYOwBFptXrEvCNMtEdsAs/ELzCfWcZX2lkl+LRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421294; c=relaxed/simple;
	bh=uhpQJtFLv1rBxsAcfck67pJR/8AGuXyPU5pS3+P1YE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=WaQSqccRev6w0leiiVR2pUoMt+vOS+owsx5l0DS0wVn9c0xsUF1jhhOZi27TtuQcykGQ1wC3DLtwYz4o5chbPSiv6iGuIze653qKcTIP4wcphQ+cFsgzt27IsoT6SjJZVLuygauG7qQiNClypHAcu1y04V54PiEE5Vxp6NnPlQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AoNNOTWj; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251014055448euoutp02b700e76937311790d1966684a72843c7~uRdWm0Wqe1362913629euoutp02r
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 05:54:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251014055448euoutp02b700e76937311790d1966684a72843c7~uRdWm0Wqe1362913629euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760421288;
	bh=KgrxKYIuyb4cf8d6Kw/QEO1mOl+rpOs8+2xF6zyBwbI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AoNNOTWje9UdiRcES1n/LO/FyiHUuq1ECbVfCOGTMRHeZXTpTmmp/T7vb67c16J3t
	 16KE+6qpFaZmrohQBoB+huJWKp/mL8GyGTv4CTg41h0kifueBNE4xskov1w8se4bgv
	 zokyMswSZwnNg1dJsquVCFisW/OKNdh+y/K1vNxs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251014055447eucas1p2c67687acd32add33c7bb253f94c46e0d~uRdWPkuq42592925929eucas1p2r;
	Tue, 14 Oct 2025 05:54:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251014055447eusmtip230ff3a2be12cab6c9753d94c32e4dd37~uRdVarDXi1545615456eusmtip2D;
	Tue, 14 Oct 2025 05:54:46 +0000 (GMT)
Message-ID: <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
Date: Tue, 14 Oct 2025 07:54:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/3] dma_mapping: Add auto cleanup support
To: Frank Li <Frank.Li@nxp.com>, Robin Murphy <robin.murphy@arm.com>, Dong
	Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251014055447eucas1p2c67687acd32add33c7bb253f94c46e0d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251010185046eucas1p26868b540b74a96e36943066216525bed
X-EPHeader: CA
X-CMS-RootMailID: 20251010185046eucas1p26868b540b74a96e36943066216525bed
References: <CGME20251010185046eucas1p26868b540b74a96e36943066216525bed@eucas1p2.samsung.com>
	<20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>

Hi

On 10.10.2025 20:50, Frank Li wrote:
> There are many below pattern
>
> 	fun()
> 	{
> 		...
> 		dma_map_single();
> 		if (dma_mapping_error)
> 			goto err1;
>
> 		dmaengine_prep_slave_single()
> 		if (...)
> 			goto err2
>
> 		dmaengine_submit()
> 		if (...)
> 			goto err3
>
> 		wait_for_completion_timeout()
> 		if (...)
> 			goto err4
>
> 	err4:
> 	err3:
> 	err2:
> 		dma_umap_single();
> 	err1:
> 	}
>
> Use cleanup can simple error handle like guard(), such as guard(mutex).
> or __free(kfree) = kmalloc.
>
> But dma_umap_single() need more argurements. So situation below complex.
>
> It need pack argurments list into structure.
>
> 	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
> 	typedef struct {                                                \
> 	       	 _return_type ret;                                       \
> 	        bool    okay;                                           \
> 	        struct  {                                               \
> 	                __REMOVE(_list_class_fields);                   \
> 	        } args;                                                 \
> 	} class_##_name##_t;
>
> So save all arugments to it.
>
> __DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
> will expand to
>
> 	struct {
> 		dma_addr_t ret;
> 		bool	okay;
> 		struct {
> 			struct device *dev;
> 			void *ptr;
> 			size_t size;
> 			enum dma_data_direction dir;
> 		}
> 	}
>
> So cleanup function can use saved argurement.
>
> The above fun will be
>
> 	fun()
> 	{
> 		CLASS(dma_map_single, dma)(dev, ...);
>
> 		...
> 		if (...)
> 			return err;
> 	}
>
> if funtion return, which need keep map,
>
> 	submit()
> 	{
> 		dma_map_single();
> 		...
> 		dmaengine_submit();
> 		if (...)
> 			goto err1
> 		return;
>
> 	goto err1:
> 		dma_umap_single();
> 	}
>
> Macro retain_and_empty() will clean varible to avoid unmap.
>
>          ({                                  \
>                  __auto_type __ptr = &(t); typeof(t) empty= {};   \
>                  __auto_type __val = *__ptr; \
>                  __ptr->okay = 0;        \
>                  __val.ret;              \
>          })
>
> So
>
> 	submit()
> 	{
>         		CLASS(dma_map_single, dma)(dev,...;
>
> 	        ...
> 	        dmaengine_submit();
> 		if (...)
> 			return err;
>
> 		//before return;
>
> 		retain_and_empty(dma)
> 	}
>
> This series just show how to hanndle many agurement at resource alloc/free
> functions. Only show dma_map_single. If the over all method is acceptable.
> I will more define for dma mapping functions.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This looks fine from the DMA-mapping API perspective. I think we should 
also get some feedback from Peter, who authored most of the __cleanup() 
based infrastructure, so I've added him to the recipients list.


> ---
> Frank Li (3):
>        cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
>        dma-mapping: Add auto cleanup support dma_map_single()
>        i2c: lpi2c: Use auto cleanup for dma_map_single()
>
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
>   include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-mapping.h        |  8 +++++
>   3 files changed, 87 insertions(+), 7 deletions(-)
> ---
> base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> change-id: 20251008-dmamap_cleanup-d0a7f0525a3d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


