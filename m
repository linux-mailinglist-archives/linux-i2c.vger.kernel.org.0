Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A362631C60
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiKUJHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiKUJHi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:07:38 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33FDB1EA;
        Mon, 21 Nov 2022 01:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669021655; x=1700557655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NtKOQXwWxME9E8FbUL/LQxGmUVDA0IDT/bdC9wETBPA=;
  b=aMnhIFsnRORY/iARsrbA3l1G19bjtZlAgCs6d1nhrx72F8rkPuX/gXog
   zEVBMQr4ZCy12J5diLM7jUuKdD/sj6NRIGG7Xw7BODR7vJ4D6032fdmpx
   E2jPqKMPm1zGEHrpvlLcoGqNg6Xe4nh3ngknlaW1vpm1aUBAbRpGBX4oS
   DTPFFNHAVcBhfJ5OvtjsbtzPFqprt3SQodzJ4WR1+etiQm7xiv1bZwAwB
   GER2PThc6DcCdGkUpI/BScoXC5Rxuy1dWkt5y2ZdSv6YOXxzBnoN8T62+
   ZZ8OsTmng9cftIjq6HfQuJfrx+6plbCaHWaCKTVPhZN3HpBd5LSM0vPnd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="340368785"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="340368785"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783376913"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783376913"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:07:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:07:28 +0200
Date:   Mon, 21 Nov 2022 11:07:28 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 580/606] usb: typec: tcpm/tcpci: Convert to i2c's
 .probe_new()
Message-ID: <Y3s/0GsGvospVc+G@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-581-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-581-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:14PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index b2bfcebe218f..d3efb9665901 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -807,8 +807,7 @@ void tcpci_unregister_port(struct tcpci *tcpci)
>  }
>  EXPORT_SYMBOL_GPL(tcpci_unregister_port);
>  
> -static int tcpci_probe(struct i2c_client *client,
> -		       const struct i2c_device_id *i2c_id)
> +static int tcpci_probe(struct i2c_client *client)
>  {
>  	struct tcpci_chip *chip;
>  	int err;
> @@ -878,7 +877,7 @@ static struct i2c_driver tcpci_i2c_driver = {
>  		.name = "tcpci",
>  		.of_match_table = of_match_ptr(tcpci_of_match),
>  	},
> -	.probe = tcpci_probe,
> +	.probe_new = tcpci_probe,
>  	.remove = tcpci_remove,
>  	.id_table = tcpci_id,
>  };

thanks,

-- 
heikki
