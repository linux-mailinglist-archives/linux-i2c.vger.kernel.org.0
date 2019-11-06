Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A10F14EE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfKFLXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:23:06 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45345 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfKFLXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:23:06 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJOviPS0ZTzKrSJOyiyAJy; Wed, 06 Nov 2019 12:23:04 +0100
Subject: Re: [RFC PATCH 10/12] media: pci: cx18: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-11-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f9cb0a3e-8f81-c641-0f32-1dc2ae2531a4@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-11-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBnx8co1aA0sT5rsRjvQSGOYy60AJNwssb1m6xgqvFyqrwrUmN/oWgBfFkbcS4vUoTeQVggX9mCzgrXhVXxkXtts5JXsSymYuAywCYYTckHq+cAhazXu
 0mAM538yLT7bRWBVwf1gBHJnHLNqZki6m+hvEETCGZuYy6jcu1CvJxEVaNUWqK4Mwo21Gsz903XCwCBjvXEYSDjmmYAn8hIBWfMt4ICyrJpEtvESSMxnoaoz
 WdybryDrUhV4iRNXko5+sZ7mHPh3ub3QxxIMcYUSM9CGjaI4BOb+7dig7S3GzZi624InISmLcx1UpSGCoP5uKEFtikrkzlrVxMAL8USCNqcTbJq8r0iTMT9p
 4mHRERlUTOVjubMGEglEQAzYtUXHlVot4Mb8BJnssHOrqg4Q4yAhqU51T59XeR7uCaIvIe+vy71e9Rg5MBbzKXz8+kNT8tXa8akXxTrQufht5EvwZZ/KrSKS
 w03fsbf1TDRJDb8s
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/19 10:50 AM, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/media/pci/cx18/cx18-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-i2c.c b/drivers/media/pci/cx18/cx18-i2c.c
> index 1ef7ccf4a722..a83435245251 100644
> --- a/drivers/media/pci/cx18/cx18-i2c.c
> +++ b/drivers/media/pci/cx18/cx18-i2c.c
> @@ -88,7 +88,7 @@ static int cx18_i2c_new_ir(struct cx18 *cx, struct i2c_adapter *adap, u32 hw,
>  		break;
>  	}
>  
> -	return i2c_new_probed_device(adap, &info, addr_list, NULL) == NULL ?
> +	return IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL)) ?
>  	       -1 : 0;
>  }
>  
> 

