Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7745E34E2C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 19:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfFDRA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 13:00:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:51030 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727715AbfFDRA4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 13:00:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 10:00:55 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2019 10:00:52 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hYCns-0001CA-D9; Tue, 04 Jun 2019 20:00:52 +0300
Date:   Tue, 4 Jun 2019 20:00:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/6] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190604170052.GQ9224@smile.fi.intel.com>
References: <20190528142900.24147-1-ckeepax@opensource.cirrus.com>
 <20190528142900.24147-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528142900.24147-2-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 28, 2019 at 03:28:56PM +0100, Charles Keepax wrote:
> Use the available IRQ helper functions, most of the functions have
> additional helpful side affects like configuring the trigger type of the
> IRQ.
> 

You do here two things, i.e.
- splitting out helper function
- converting it to use helpers

I would split the patch to do exact these steps separately, e.g.:
- splitting out to a local helper
- replacing open coded stuff with existing helpers


> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v2:
>  - Don't consider zero to be a valid IRQ number
> 
> Thanks,
> Charles
> 
>  drivers/i2c/i2c-core-acpi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 2728006920888..bc82b44f85860 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -137,14 +137,25 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
>  	return 0;
>  }
>  
> +static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> +{
> +	int *irq = data;
> +	struct resource r;
> +
> +	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> +		*irq = i2c_dev_irq_from_resources(&r, 1);
> +
> +	return 1; /* No need to add resource to the list */
> +}
> +
>  static int i2c_acpi_get_info(struct acpi_device *adev,
>  			     struct i2c_board_info *info,
>  			     struct i2c_adapter *adapter,
>  			     acpi_handle *adapter_handle)
>  {
>  	struct list_head resource_list;
> -	struct resource_entry *entry;
>  	struct i2c_acpi_lookup lookup;
> +	int irq = -ENOENT;
>  	int ret;
>  
>  	memset(&lookup, 0, sizeof(lookup));
> @@ -176,16 +187,13 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  
>  	/* Then fill IRQ number if any */
>  	INIT_LIST_HEAD(&resource_list);
> -	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
> +	ret = acpi_dev_get_resources(adev, &resource_list,
> +				     i2c_acpi_add_resource, &irq);
>  	if (ret < 0)
>  		return -EINVAL;
>  
> -	resource_list_for_each_entry(entry, &resource_list) {
> -		if (resource_type(entry->res) == IORESOURCE_IRQ) {
> -			info->irq = entry->res->start;
> -			break;
> -		}
> -	}
> +	if (irq > 0)
> +		info->irq = irq;
>  
>  	acpi_dev_free_resource_list(&resource_list);
>  
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


