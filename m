Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF2D562B04
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 07:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234398AbiGAFrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 01:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234423AbiGAFrh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 01:47:37 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CFD68A38;
        Thu, 30 Jun 2022 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656654456; x=1688190456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Isy2vf1MMMuyEw6FjN6hYjOB38jJmfhpCIoqFRQ0Z2M=;
  b=BoyWNACy3TkB8QM/8y8DnC53BjKZaoJOJfotMhiVKUzWI5imZkDoJ/dW
   C7O1ti+Eo1gKk9JykXt7M12TQcVcxA1PjlHWDUO3Vs/xP52J0kqEAN7j4
   hJ/NBIfIvPVYZZv4ufmwVQuMg55+vWbiCDmZf1pvrWDm12NqP9MZGGQCk
   oJ9FeH1mFbfI+oCP3BJqFNj7uF14FtysuXhyC9iDLTFAjBmUS+a6l4bIs
   rtELxh0LGJqtfQPyVUQV3JkY4fZw8sQAfZTXxV1KI8WgVeGMKpVqDsGKO
   ORu9j4BhFFLGq7+9oPz4wZvNlIEqIm6S9LIOPIVtm5x8pndi8NdlPHcS2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="281322763"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="281322763"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 22:47:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="566121503"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 22:47:31 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 01 Jul 2022 08:47:28 +0300
Date:   Fri, 1 Jul 2022 08:47:28 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v1 1/5] ACPI: utils: Introduce
 acpi_match_video_device_handle() helper
Message-ID: <Yr6KcPlC/3rYAtKE@lahna>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Fri, Jul 01, 2022 at 12:28:15AM +0300, Andy Shevchenko wrote:
>  extern long acpi_is_video_device(acpi_handle handle);
> +extern bool acpi_match_video_device_handle(acpi_handle handle);

I think we can do slightly better here. The only caller of
acpi_is_video_device() is in drivers/acpi/video_detect.c so we can move
it there and make it static (is_video_device()).

Then we can name this one acpi_is_video_device() instead and in addition
make it take struct acpi_device as parameter instead of acpi_handle (I
think we should not use acpi_handles in drivers if possible).
