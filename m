Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71F87874C9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 18:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbjHXQAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 12:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242386AbjHXQAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 12:00:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5B51BDA;
        Thu, 24 Aug 2023 09:00:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB04966D9E;
        Thu, 24 Aug 2023 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49742C433C7;
        Thu, 24 Aug 2023 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692892812;
        bh=w6DubEnHWITnA7qJDewRABFVLEud1owzihxV+3GqNWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RUubxuYNkgz8hcnusxaaLoHC9qXut7slmskPsbpolndJ0dNazO/qeu38Cch3IEJ+x
         TrjTfsGasJD5psBGlvGf5Pd9BZSRdHkzieGjavkSZVRL1xWouTD75Li3hkkgzZW+ga
         M8knQq6K6fHAK3MW/3Jj3qVr1XMxaFchB2dax/T7tsy2MbWrbxSYXLLU+nCIwKuPOp
         3zydWWS6KTaTUMhGg4dCiiG+XmpUw4HwtnlDD7zmXtSoyC1Qn6TjbaMIgTgulRVav1
         jv1fQpqFslo2Y0T2BUyWqggVYaLO/PRvndwQe3evZZcu0xU/zYcxEdOXNVq8VjQIV1
         a88BiDNUvOTFg==
Date:   Thu, 24 Aug 2023 18:00:06 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/14] I2C: ali15x3: Do PCI error checks on own line
Message-ID: <20230824160006.ahcv2twl4c4q5cd5@intel.intel>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
 <20230824132832.78705-8-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824132832.78705-8-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ilpo,

On Thu, Aug 24, 2023 at 04:28:25PM +0300, Ilpo Järvinen wrote:
> Instead of if conditions with line splits, use the usual error handling
> pattern with a separate variable to improve readability.
> 
> No functional changes intended.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-ali15x3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index cc58feacd082..6fedecef9df3 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -122,6 +122,7 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  {
>  	u16 a;
>  	unsigned char temp;
> +	int ret;

can you please add this ret declaration inside the
"if (force_addr)"?

Andi

>  
>  	/* Check the following things:
>  		- SMB I/O address is initialized
> @@ -167,12 +168,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  	if(force_addr) {
>  		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>  			ali15x3_smba);
> -		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
> -								SMBBA,
> -								ali15x3_smba))
> +		ret = pci_write_config_word(ALI15X3_dev, SMBBA, ali15x3_smba);
> +		if (ret != PCIBIOS_SUCCESSFUL)
>  			goto error;
> -		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
> -								SMBBA, &a))
> +		ret = pci_read_config_word(ALI15X3_dev, SMBBA, &a);
> +		if (ret != PCIBIOS_SUCCESSFUL)
>  			goto error;
>  		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
>  			/* make sure it works */
> -- 
> 2.30.2
> 
