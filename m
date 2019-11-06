Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C79F14D3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfKFLSf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:18:35 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39477 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727391AbfKFLSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:18:35 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJKWiPPkxTzKrSJKaiy8X2; Wed, 06 Nov 2019 12:18:32 +0100
Subject: Re: [RFC PATCH 08/12] media: pci: cx88: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-9-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <faa29a3b-c939-eec3-355e-8c0ddc873391@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-9-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPPrPEgl/e6PlsHQf1PVG7+t9BuDd5hPsz+YvyEUimRnm2bOxycpzj8P+U1ME9ra/joFTgu65ejIp6Qz/x9hCziSXsYqlb2pCd41b+szd7Nz++bIUZVW
 UgSLENZrg84KbDFbnu/9dvvnn0VquEkRnAf2ZoYLAg8yFjHWlGFAdiO1nNG2GCyjFYaq5VD1nL5Gpnet1ZRif1pCfJPs+gnBj32/hP3e5P5stThk/GoTvXMK
 sJHHAT2HXJAxloQCwGfdjRUlwlthToq0pffgDcrdVWlaylJKvwzQ+80rdjafCb9C+LzCRyLDCndZQleE5Tw0pI/v0xNs46maAsnEZu5zseLt4QsWZWH2+PS6
 JpsIL5/KOznwTrZCHQbgO9TvoQdW8bFWhiz206Kn8RvU60aQpd2l4wKeFL38yGIT4/MVA1EbiLy+4vPjsAKudu0PxGqaHg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/19 10:50 AM, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.

This commit text is a bit out-of-sync with the actual patch.

This should be improved for the next version. Looks good otherwise.

Regards,

	Hans

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/media/pci/cx88/cx88-input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
> index 589f52d961eb..c7c2acd55266 100644
> --- a/drivers/media/pci/cx88/cx88-input.c
> +++ b/drivers/media/pci/cx88/cx88-input.c
> @@ -613,7 +613,7 @@ void cx88_i2c_init_ir(struct cx88_core *core)
>  	}
>  
>  	/*
> -	 * We can't call i2c_new_probed_device() because it uses
> +	 * We can't call i2c_new_scanned_device() because it uses
>  	 * quick writes for probing and at least some RC receiver
>  	 * devices only reply to reads.
>  	 * Also, Hauppauge XVR needs to be specified, as address 0x71
> 

