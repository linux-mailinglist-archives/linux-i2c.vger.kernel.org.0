Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7EEF14EA
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfKFLVy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:21:54 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38103 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfKFLVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:21:54 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJNjiPRPGTzKrSJNniy9ru; Wed, 06 Nov 2019 12:21:51 +0100
Subject: Re: [RFC PATCH 11/12] media: pci: ivtv: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-12-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b1435694-2a22-5f9b-5519-8c42b71f0e8a@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:21:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-12-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNQfnoz7H8UyaU3z8YrxdjOdiwPFwlDzu0UNmhJ2aV+MkxozhdNM3kwLTMRtCr7zumjuChE0jjIhdLGNr/tVFbe/+pSZQ4fxq9chafIsVnuh3JUBX4Qs
 /He4orprxrp3DOD916oDr3SzXpO3QSiLd+dyLp0+p9XcLScJFZDO3FAX9KPtvaobMvXlfkN+Wqetk0v5q54Om2vLCVoZ2Ojy/1UAvQ++yDK3XQUx5Q99d46J
 duIz/AJHVA6YPrNRoziLi8WBRrPGeOW6Sv036TxNPW0RlvYCkVL4+peNPRjAfWAxn/UreCoUfL3bNwuqEtRktIwSmKSZm6F5jQEESFpaqPGrzxgEWmSUu2qs
 7/dIw/3KxvC3SBYec8FVNrmHabeJYViBobGywZnm1l8U7lWRi0IwNbqzORT8p8jtcxP83OARmO30T5enKDgF9dGa7KWPMOXXNSgXIy+P85fhlsyZduMqY4TG
 KVafK2vGvm3dFy2l
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/19 10:50 AM, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable. Change
> the legacy function to simply return void because the retval was never
> used anywhere.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/media/pci/ivtv/ivtv-i2c.c | 6 +++---
>  drivers/media/pci/ivtv/ivtv-i2c.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
> index 0772d757a389..982045c4eea8 100644
> --- a/drivers/media/pci/ivtv/ivtv-i2c.c
> +++ b/drivers/media/pci/ivtv/ivtv-i2c.c
> @@ -208,12 +208,12 @@ static int ivtv_i2c_new_ir(struct ivtv *itv, u32 hw, const char *type, u8 addr)
>  	info.platform_data = init_data;
>  	strscpy(info.type, type, I2C_NAME_SIZE);
>  
> -	return i2c_new_probed_device(adap, &info, addr_list, NULL) == NULL ?
> +	return IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL)) ?
>  	       -1 : 0;
>  }
>  
>  /* Instantiate the IR receiver device using probing -- undesirable */
> -struct i2c_client *ivtv_i2c_new_ir_legacy(struct ivtv *itv)
> +void ivtv_i2c_new_ir_legacy(struct ivtv *itv)
>  {
>  	struct i2c_board_info info;
>  	/*
> @@ -235,7 +235,7 @@ struct i2c_client *ivtv_i2c_new_ir_legacy(struct ivtv *itv)
>  
>  	memset(&info, 0, sizeof(struct i2c_board_info));
>  	strscpy(info.type, "ir_video", I2C_NAME_SIZE);
> -	return i2c_new_probed_device(&itv->i2c_adap, &info, addr_list, NULL);
> +	i2c_new_scanned_device(&itv->i2c_adap, &info, addr_list, NULL);
>  }
>  
>  int ivtv_i2c_register(struct ivtv *itv, unsigned idx)
> diff --git a/drivers/media/pci/ivtv/ivtv-i2c.h b/drivers/media/pci/ivtv/ivtv-i2c.h
> index 462f73449a6e..2d9cdaa682c5 100644
> --- a/drivers/media/pci/ivtv/ivtv-i2c.h
> +++ b/drivers/media/pci/ivtv/ivtv-i2c.h
> @@ -9,7 +9,7 @@
>  #ifndef IVTV_I2C_H
>  #define IVTV_I2C_H
>  
> -struct i2c_client *ivtv_i2c_new_ir_legacy(struct ivtv *itv);
> +void ivtv_i2c_new_ir_legacy(struct ivtv *itv);
>  int ivtv_i2c_register(struct ivtv *itv, unsigned idx);
>  struct v4l2_subdev *ivtv_find_hw(struct ivtv *itv, u32 hw);
>  
> 

