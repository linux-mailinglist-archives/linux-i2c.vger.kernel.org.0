Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B307C341E1A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 14:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCSN0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 09:26:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:46642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhCSN0q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 09:26:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF69E64EF2;
        Fri, 19 Mar 2021 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616160406;
        bh=+fFLKenKDfFeW/qha9ZQ83ZON/mz8Oj9IJEDQuJvrCc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=k20QHGRlxLhsxwVdeGjZTYuDtCq3g/9WW0Etj1eZALfIaJqpydHHN5V0QHaua20UN
         uJNYfcvgYwJXh1A9xlScmNYEdxgxeXkU0eiwKSabHMpd8jKDLMElFs4Bi28kL0T5Pk
         8iLsvknlWjAJCW4AVOZoVGEojkPrQePvopUx0+wLxB0no7DHC5sYQ5Vbn+TDxDbsWV
         t0HOa2hTWJtSmlqCeCJHVY+Hx19xGmYbQa4JJxaqMbHn3Wz1Yn6Bvmd8IZVCD5+xwH
         oLv+N9pTavFf2m2UOIw1Kvw27TinpQHYSJzbbWiZVc8rCDewWwRhyeljrElD2cKoG2
         seyGZoC6EUHYg==
Date:   Fri, 19 Mar 2021 14:26:43 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Michael Zaidman <michael.zaidman@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: ft260: fix an error message in
 ft260_i2c_write_read()
In-Reply-To: <YFMt5pml1voGQkUy@mwanda>
Message-ID: <nycvar.YFH.7.76.2103191426350.12405@cbobk.fhfr.pm>
References: <YFMt5pml1voGQkUy@mwanda>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Mar 2021, Dan Carpenter wrote:

> The "len" variable is uninitialize.
> 
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hid/hid-ft260.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 047aa85a7c83..a5751607ce24 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -512,7 +512,8 @@ static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
>  	struct hid_device *hdev = dev->hdev;
>  
>  	if (msgs[0].len > 2) {
> -		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__, len);
> +		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__,
> +			msgs[0].len);
>  		return -EOPNOTSUPP;
>  	}

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs

