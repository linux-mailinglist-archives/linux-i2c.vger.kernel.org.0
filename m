Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BEF4E7514
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 15:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353701AbiCYOdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 10:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359360AbiCYOdJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 10:33:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F12CC3378;
        Fri, 25 Mar 2022 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648218695; x=1679754695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9+8aFhA/+B4ahNQ5lOWSM8GwqfVxiDZVUYR7dHNM6U4=;
  b=ADKElAA9PBsCNIpatiqdN97i2T+pRC6Bt9ydtRM+tcP2MbMslriw/Vzv
   ik9Bj7SnivglJjNo1FAX5K02Hy4AnKEw0S02yO3G10YsTp7yvrYQAyp3z
   c1BPqZYCYfK1dUUkcMkCE4PARMbvKlRSMhD1hMwLiiBp8YxS0MJhVtHhe
   DYM3xOEsV7mVdpSXue9r8m1J4KhY0XsFoqAZ7J4RnWNzPK7t0UrPU/usb
   Aj56MClMHDyUCX2I1ILQa144fQgTn6MZsrn2+qgoJKEA/T1adkN4LpLRV
   nvEBc0eHcyV9CuQ5fCvc4QOgL74EpNobvctCAXukj3Ij2x2lg++ui7Su1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="257471552"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="257471552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:31:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="648277654"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:31:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXkxh-006RQb-R7;
        Fri, 25 Mar 2022 16:30:45 +0200
Date:   Fri, 25 Mar 2022 16:30:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/9] device property: add index argument to
 property_read_string_array() callback
Message-ID: <Yj3SFYdUQ4r7GXqs@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-4-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-4-clement.leger@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 12:31:42PM +0100, Clément Léger wrote:
> This will allow to read a string array from a specified offset. Support
> for this new parameter has been added in both of through the use of
> of_property_read_string_array_index() and in swnode though the existing
> property_entry_read_string_array() function. ACPI support has not yet
> been added and only index == 0 is accepted.

...

>  static int
>  acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
>  				       const char *propname, const char **val,
> -				       size_t nval)
> +				       size_t nval, int index)
>  {
> +	if (index != 0)
> +		return -EINVAL;
> +
>  	return acpi_node_prop_read(fwnode, propname, DEV_PROP_STRING,
>  				   val, nval);

I guess it would be nice if some of us (ACPI folks) can provide a proper
prerequisite patch.

...

> -	array_len = min_t(size_t, nval, array_len);
>  	length = array_len * sizeof(*strings);

> -

Stray change.

>  	pointer = property_entry_find(props, propname, length);
>  	if (IS_ERR(pointer))
>  		return PTR_ERR(pointer);

> +	if (index >= array_len)
> +		return -ENODATA;

I was about to ask if we can check this before the property_entry_find() call,
but realized that in such case it will shadow possible errors due to wrong or
absent property.

...

> -		of_property_read_string_array(node, propname, val, nval) :
> +		of_property_read_string_array_index(node, propname, val, nval,
> +						    index) :

Dunno about the style there, but I think it can be one line.

-- 
With Best Regards,
Andy Shevchenko


