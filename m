Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B6B242743
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 11:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgHLJNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 05:13:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:40183 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgHLJNm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Aug 2020 05:13:42 -0400
IronPort-SDR: IfM3j/VTzCXBkQoI75MlQBxqfDzK01hSyuhaqHa7S2gAPk+o26uglB9/UJRKrEG+jR39aiW3GT
 dd8+S8cZ1kAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141534164"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
   d="scan'208";a="141534164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 02:13:41 -0700
IronPort-SDR: 52x4G4nxphbG7wbFf9Bhd4oVDxjk3eeTi2GzwyrdU60wWFA2d3CAQsChy4xOcdkN8m2MdKEtc0
 MMvG43id3Lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
   d="scan'208";a="318027426"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2020 02:13:37 -0700
Subject: Re: [PATCH v5 3/6] ov5670: Support probe whilst the device is in a
 low power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
 <20200810142747.12400-4-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7a1fa217-7fd1-1d36-0b1c-ad5d09ea11a0@linux.intel.com>
Date:   Wed, 12 Aug 2020 17:12:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810142747.12400-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/10/20 10:27 PM, Sakari Ailus wrote:
> Tell ACPI device PM code that the driver supports the device being in a
> low power state when the driver's probe function is entered.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov5670.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index f26252e35e08d..1f75b888d2a18 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2456,6 +2456,7 @@ static int ov5670_probe(struct i2c_client *client)
>  	struct ov5670 *ov5670;
>  	const char *err_msg;
>  	u32 input_clk = 0;
> +	bool low_power;
>  	int ret;
>  
>  	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> @@ -2472,11 +2473,14 @@ static int ov5670_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
>  
> -	/* Check module identity */
> -	ret = ov5670_identify_module(ov5670);
> -	if (ret) {
> -		err_msg = "ov5670_identify_module() error";
> -		goto error_print;
> +	low_power = acpi_dev_state_low_power(&client->dev);
> +	if (!low_power) {
> +		/* Check module identity */
> +		ret = ov5670_identify_module(ov5670);
> +		if (ret) {
> +			err_msg = "ov5670_identify_module() error";
> +			goto error_print;
> +	

Sakari, thanks for your patch.
one question - With this change, there will be no chance for driver to guarantee
that the camera sensor plugged in is the camera that the matched driver actually
can drive until try to streaming the camera, so is it necessary to return
appropriate error in .s_stream ops to notify user it is not the hardware that
current driver can drive? if no other better way.

-- 
Best regards,
Bingbu Cao
