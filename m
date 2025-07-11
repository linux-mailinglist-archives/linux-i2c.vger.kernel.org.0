Return-Path: <linux-i2c+bounces-11911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FCB01F6D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 16:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F45B5C31AE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 14:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971DA2E9726;
	Fri, 11 Jul 2025 14:47:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE922E92C4;
	Fri, 11 Jul 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245243; cv=none; b=BOfGTJTW4oK4w8YBx1IbVNs0MMtR6WVDOKc7lmbD+bINzP4C1uDszDTpfMDYvUIMN3bow4r6vXXn8kUhy1ZRAL5bB+gGhznTzF6cGL97nW7f2WFbKXwqirTaojKR+x0A2vcjuOk1OFh3ugr2uSIrXO67Ousj35FErUeaItgv/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245243; c=relaxed/simple;
	bh=akB4FuBnbjLM/h59UZnhNYKInZ3+sj2sgrqMFqSCvY8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLP6KCvrbkURpouw/FqrJyztlv7DVHvNdsy1HucMx59F2is/yUpA1vvAMkZlmfEkYF76wBLWE3GULBYoL/6n7eGGeInjXW7operAuY1PegOWzo5/uJ5DoLZ1uTG0+X0oX9jQc629J2OKC3g7dAAZ3eSMyVtQoultyleod/Z6xUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdvfm31Byz6L5J0;
	Fri, 11 Jul 2025 22:46:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A5041402EF;
	Fri, 11 Jul 2025 22:47:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 16:47:19 +0200
Date: Fri, 11 Jul 2025 15:47:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Qianfeng Rong <rongqianfeng@vivo.com>, <wsa+renesas@sang-engineering.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <20250711154717.00000319@huawei.com>
In-Reply-To: <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
	<tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 10 Jul 2025 22:42:26 +0200
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi Qianfeng,
> 
> On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> > Use min() to reduce the code and improve its readability.
> > 
> > The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> > was changed from int to u32, because the max parameter passed
> > in is always greater than 0.
> > 
> > Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> The 'Suggested-by' tag implies that the patch was suggested by
> Jonathan, which is not the case here. Jonathan reviewed the patch
> and proposed improvements, but the patch itself comes from you.
> 
> For this reason, I will remove the 'Suggested-by' tag. If
> Jonathan wants to add his Acked-by or Reviewed-by, I will gladly
> include it.

Trivial enough that I don't care ;)  Was a drive by review at
best.

Thanks for asking though.

J

> 
> Thanks, Jonathan, for the helpful reviews, and thanks to Qianfeng
> for promptly following up on the feedback.
> 
> Merged to i2c/i2c-host.
> 
> Thanks,
> Andi
> 


