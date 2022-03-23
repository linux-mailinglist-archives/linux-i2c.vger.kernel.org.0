Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D794E53B4
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 14:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244543AbiCWN7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 09:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244546AbiCWN7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 09:59:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288527E59A;
        Wed, 23 Mar 2022 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648043857; x=1679579857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7dpl7zrQjuC3jYV/6lKewPXHNVm4wSMQm8NRFYTb318=;
  b=KiO9N07KImQHEGWKbg70aNuA/DR+2CQpc3sKetdBWHYlrw8irmcigX8S
   y7BoWFjAUhHaBWrq6nd4i7JatKXWsvD1oY6NRbFSMCvkDFjZfNjkNN5ci
   MW85oMDZuSJCs4Ic9vVttG9xc0vEHrTgphdG4n05ozs2u/zxbCgVPDSyJ
   yfF9DLdoieHjU0H4NdcBuOdB2N6Y6gq6dVx0dSq5HAfoWm60YwcVPUcmp
   V9NbfIlDE5x3EorMVe+QLHhf6dqpRSd16KzQYkURMoSWb/knJP/60nbbP
   OxY+7xchAQDjxjfsESaYWlL/McwpCB1qTFkCrVEI9tQmNPE41TFHaveUt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="258067239"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="258067239"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 06:57:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="785795051"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 06:57:32 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 3FA602012F;
        Wed, 23 Mar 2022 15:57:30 +0200 (EET)
Date:   Wed, 23 Mar 2022 15:57:30 +0200
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
Message-ID: <YjsnSiUchGzLoA2H@paasikivi.fi.intel.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
 <20220323091810.329217-2-clement.leger@bootlin.com>
 <YjsFr4m/7pspMxD0@paasikivi.fi.intel.com>
 <20220323123902.37e45f78@fixe.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323123902.37e45f78@fixe.home>
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Clément,

On Wed, Mar 23, 2022 at 12:39:02PM +0100, Clément Léger wrote:
> Le Wed, 23 Mar 2022 13:34:07 +0200,
> Sakari Ailus <sakari.ailus@linux.intel.com> a écrit :
> 
> > >   * @get_parent: Return the parent of an fwnode.
> > > @@ -123,6 +126,9 @@ struct fwnode_operations {
> > >  	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
> > >  				      const char *propname, const char **val,
> > >  				      size_t nval);
> > > +	int (*property_read_string_index)(const struct fwnode_handle *fwnode,
> > > +					  const char *propname, int index,
> > > +					  const char **string);  
> > 
> > Could this instead be done by adding an index argument to the
> > property_read_string_array?
> 
> Hi Sakari,
> 
> I guess I could do that. Do you expect the string pointer to be
> returned in "val" ? Guess a -1 index would mean that we don't care
> about the index but want the array to be returned. And if index is
> specified, nval will be ignored.

I'd keep the behaviour the same independently of the value of index.

-- 
Sakari Ailus
