Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1631788224
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbjHYIfK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 04:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbjHYIey (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 04:34:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A71519AC;
        Fri, 25 Aug 2023 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692952492; x=1724488492;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o8sa3XGpijYGYefLCVVAo4o9RIa9+XLPTSaFDF+9KEQ=;
  b=jzdqrqHmKbw5hyvFmb0NSiUaljyDLJ9P6fpiN8bBCswreaP0QNBC6W+n
   2eRiQvHPrZSjyDJRzkOD4bK0QquEoznfdHAE9LWikIk8wjnXmEtvK7Vne
   yATFeB5i8XkT3VStiM6Z33S6R9yHQEhoJyvQbFWEdpyBRMPOoDPUQ5RiO
   2RWUMHYadw/x9bNBhruIjDVK6/gjIEULgxTwsc3gVuTC1mQWoDADSLLWv
   NXtIcJz3BXjsIDU/S5Ep7qQRGyajr7XlwTSoRBGjLcHZMVss6Cd5GzarO
   5vJt32Jpou6RG823BiKdCOUxS8Pu4RWFoUVu5PH5OYCrixVxFBfsA8pwO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441010686"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="441010686"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1068164200"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068164200"
Received: from enguerra-mobl.ger.corp.intel.com ([10.251.213.8])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:34:49 -0700
Date:   Fri, 25 Aug 2023 11:34:47 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/14] I2C: ali15x3: Do PCI error checks on own line
In-Reply-To: <20230824160006.ahcv2twl4c4q5cd5@intel.intel>
Message-ID: <41c95216-ed27-28fe-919a-beecc138888c@linux.intel.com>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com> <20230824132832.78705-8-ilpo.jarvinen@linux.intel.com> <20230824160006.ahcv2twl4c4q5cd5@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-228556480-1692952491=:3206"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-228556480-1692952491=:3206
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 24 Aug 2023, Andi Shyti wrote:
> On Thu, Aug 24, 2023 at 04:28:25PM +0300, Ilpo Järvinen wrote:
> > Instead of if conditions with line splits, use the usual error handling
> > pattern with a separate variable to improve readability.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/i2c/busses/i2c-ali15x3.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> > index cc58feacd082..6fedecef9df3 100644
> > --- a/drivers/i2c/busses/i2c-ali15x3.c
> > +++ b/drivers/i2c/busses/i2c-ali15x3.c
> > @@ -122,6 +122,7 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
> >  {
> >  	u16 a;
> >  	unsigned char temp;
> > +	int ret;
> 
> can you please add this ret declaration inside the
> "if (force_addr)"?

Sure.

Thanks for taking a look.

-- 
 i.


> >  	/* Check the following things:
> >  		- SMB I/O address is initialized
> > @@ -167,12 +168,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
> >  	if(force_addr) {
> >  		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
> >  			ali15x3_smba);
> > -		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
> > -								SMBBA,
> > -								ali15x3_smba))
> > +		ret = pci_write_config_word(ALI15X3_dev, SMBBA, ali15x3_smba);
> > +		if (ret != PCIBIOS_SUCCESSFUL)
> >  			goto error;
> > -		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
> > -								SMBBA, &a))
> > +		ret = pci_read_config_word(ALI15X3_dev, SMBBA, &a);
> > +		if (ret != PCIBIOS_SUCCESSFUL)
> >  			goto error;
> >  		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
> >  			/* make sure it works */

--8323329-228556480-1692952491=:3206--
