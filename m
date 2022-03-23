Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2A4E5159
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 12:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235817AbiCWLfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 07:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235560AbiCWLfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 07:35:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E5675601;
        Wed, 23 Mar 2022 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648035255; x=1679571255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XcpxrpodmHHAGGo3ZbCrVQ7fjR4rdhZnLOvk/WmCVzc=;
  b=M4//BWEV1GTpn0LJZ/oEWFYmWlRvUDPV1pzqyDfZoh8iMj0Cujo1cNrG
   EVl+6xwVLVgFXxVx3Evf18XKmFXGs3L0k8dCdPTxHaDnf9opkwp12BSaA
   SPIRcOTCwWTyUQH+ZB0IAKj1oA+iTJe/bNJcNI/NAqmlFEwkPcHNrcsTM
   ZukDSZQzj+suadK9B3whKp8z9ZoQ29x7KPPW/xtWYIcc+5dGgITHF/A4B
   uHw/3EyQ7rGdO3U2T44MilepJbiAQaYF9c8yVZOEtMlV7R/afBtpQT/g/
   ROGHTzRljOlvfInkgeqTVSfgfxlu7HYCdIkkxH1ZHOAod6DJECX9ucUQr
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="257802158"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="257802158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 04:34:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="560859985"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 04:34:10 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id ED701204A8;
        Wed, 23 Mar 2022 13:34:07 +0200 (EET)
Date:   Wed, 23 Mar 2022 13:34:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/7] device property: add
 fwnode_property_read_string_index()
Message-ID: <YjsFr4m/7pspMxD0@paasikivi.fi.intel.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
 <20220323091810.329217-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323091810.329217-2-clement.leger@bootlin.com>
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Clément,

Thanks for the set.

On Wed, Mar 23, 2022 at 10:18:04AM +0100, Clément Léger wrote:
> Add fwnode_property_read_string_index() function which allows to
> retrieve a string from an array by its index. This function is the
> equivalent of of_property_read_string_index() but for fwnode support.
> A .property_read_string_index callback is added to fwnode_ops to avoid
> doing a full allocation of an array just to retrieve one value.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  drivers/base/property.c  | 26 ++++++++++++++++++++++++++
>  include/linux/fwnode.h   |  6 ++++++
>  include/linux/property.h |  3 +++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index e6497f6877ee..a8dd6e496a1d 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -451,6 +451,32 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
>  }
>  EXPORT_SYMBOL_GPL(fwnode_property_match_string);
>  
> +/**
> + * fwnode_property_read_string_index - read a string in an array using an index
> + * @fwnode: Firmware node to get the property of
> + * @propname: Name of the property holding the array
> + * @index: Index of the string to look for
> + * @string: Pointer to the string if found
> + *
> + * Find a string by a given index in a string array and if it is found return
> + * the string value in @string.
> + *
> + * Return: %0 if the property was found (success),
> + *	   %-EINVAL if given arguments are not valid,
> + *	   %-ENODATA if the property does not have a value,
> + *	   %-EPROTO if the property is not an array of strings,
> + *	   %-ENXIO if no suitable firmware interface is present.
> + */
> +int fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
> +				      const char *propname, int index,
> +				      const char **string)
> +{
> +	return fwnode_call_int_op(fwnode, property_read_string_index, propname,
> +				  index,
> +				  string);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_property_read_string_index);
> +
>  /**
>   * fwnode_property_get_reference_args() - Find a reference with arguments
>   * @fwnode:	Firmware node where to look for the reference
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 3a532ba66f6c..71ba8f53cf1e 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -93,6 +93,9 @@ struct fwnode_reference_args {
>   *			     success, a negative error code otherwise.
>   * @property_read_string_array: Read an array of string properties. Return zero
>   *				on success, a negative error code otherwise.
> + * @property_read_string_index: Read a string from a string array using an
> + *				index. Return zero on success, a negative error
> + *				code otherwise.
>   * @get_name: Return the name of an fwnode.
>   * @get_name_prefix: Get a prefix for a node (for printing purposes).
>   * @get_parent: Return the parent of an fwnode.
> @@ -123,6 +126,9 @@ struct fwnode_operations {
>  	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
>  				      const char *propname, const char **val,
>  				      size_t nval);
> +	int (*property_read_string_index)(const struct fwnode_handle *fwnode,
> +					  const char *propname, int index,
> +					  const char **string);

Could this instead be done by adding an index argument to the
property_read_string_array?

The ACPI case is a bit more work but it guess it could be implemented later
as part of a more general cleanup there.

>  	const char *(*get_name)(const struct fwnode_handle *fwnode);
>  	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
>  	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 7399a0b45f98..a033920eb10a 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -70,6 +70,9 @@ int fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
>  				      size_t nval);
>  int fwnode_property_read_string(const struct fwnode_handle *fwnode,
>  				const char *propname, const char **val);
> +int fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
> +				      const char *propname, int index,
> +				      const char **string);
>  int fwnode_property_match_string(const struct fwnode_handle *fwnode,
>  				 const char *propname, const char *string);
>  int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,

-- 
Kind regards,

Sakari Ailus
