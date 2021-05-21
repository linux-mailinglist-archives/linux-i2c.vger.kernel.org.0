Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6C238C459
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 12:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhEUKHu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 06:07:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:44528 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231995AbhEUKHo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 06:07:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 09393AAA6;
        Fri, 21 May 2021 10:06:20 +0000 (UTC)
Date:   Fri, 21 May 2021 12:06:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 03/16] i2c: busses: i2c-ali1563: File headers are not
 good candidates for kernel-doc
Message-ID: <20210521120619.503cb7d9@endymion>
In-Reply-To: <20210520190105.3772683-4-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
        <20210520190105.3772683-4-lee.jones@linaro.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

On Thu, 20 May 2021 20:00:52 +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-ali1563.c:24: warning: expecting prototype for i2c(). Prototype was for ALI1563_MAX_TIMEOUT() instead

Thanks for taking care of the warnings. I agree that a clean W=1 build
would be very nice to have.

> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Rudolf Marek <r.marek@assembler.cz>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-ali1563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali1563.c b/drivers/i2c/busses/i2c-ali1563.c
> index 4d12e3da12f0d..55a9e93fbfeb5 100644
> --- a/drivers/i2c/busses/i2c-ali1563.c
> +++ b/drivers/i2c/busses/i2c-ali1563.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   *	i2c-ali1563.c - i2c driver for the ALi 1563 Southbridge
>   *
>   *	Copyright (C) 2004 Patrick Mochel

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
