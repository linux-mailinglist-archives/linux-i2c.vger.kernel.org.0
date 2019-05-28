Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431872C45A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 12:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfE1Kfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 06:35:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:42368 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfE1Kfn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 06:35:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 03:35:42 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 28 May 2019 03:35:39 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 28 May 2019 13:35:38 +0300
Date:   Tue, 28 May 2019 13:35:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Message-ID: <20190528103538.GC2781@lahna.fi.intel.com>
References: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
 <20190527151932.14310-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527151932.14310-3-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 27, 2019 at 04:19:29PM +0100, Charles Keepax wrote:
>  static int i2c_acpi_get_info(struct acpi_device *adev,
>  			     struct i2c_board_info *info,
>  			     struct i2c_adapter *adapter,
>  			     acpi_handle *adapter_handle)
>  {
> -	struct list_head resource_list;
>  	struct i2c_acpi_lookup lookup;
> -	int irq = -ENOENT;
>  	int ret;
>  
>  	memset(&lookup, 0, sizeof(lookup));
> @@ -186,16 +202,9 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  		*adapter_handle = lookup.adapter_handle;
>  
>  	/* Then fill IRQ number if any */
> -	INIT_LIST_HEAD(&resource_list);
> -	ret = acpi_dev_get_resources(adev, &resource_list,
> -				     i2c_acpi_add_resource, &irq);
> -	if (ret < 0)
> -		return -EINVAL;
> -
> -	if (irq >= 0)
> -		info->irq = irq;
> -
> -	acpi_dev_free_resource_list(&resource_list);
> +	ret = i2c_acpi_get_irq(adev);
> +	if (ret >= 0)

Same comment here regarding irq == 0.
