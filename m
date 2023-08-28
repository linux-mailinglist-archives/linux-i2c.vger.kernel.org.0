Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7026B78BAD3
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 00:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjH1WLL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 18:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjH1WKn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 18:10:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4490D7;
        Mon, 28 Aug 2023 15:10:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4E706304F;
        Mon, 28 Aug 2023 22:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D48CC433C7;
        Mon, 28 Aug 2023 22:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693260640;
        bh=fZd3AB1DhmkzRDsQN04BoXQg1MSXWCp4QTNzl46m7v0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z7blGISDqgou4eLu/2O4vBnKWuyLgEtYZUsC0uwjXWYBgR0mokpG+lB3V27jOShsv
         A61ajiWOUCk+jMzhaVjdKkM59FTYn7W+r2EcRS28OtYIFIJN51Wy4TqTwV3yGJSjs2
         I8gMYQ6TAF4WAp/x/TzkgYZr+d2nXypUrdU87Kk/uWFinvIxq4rrbZwpRSoG+LDG5b
         8wG7yF3Xaweh7xL37VS9YIPV7dJJZA5sF16St6S/LuHK/7eeujFS9y//itGfSFZ9zx
         xPj4FU0UT6vbDBOTmWkptjc/on8jhbXb+f3sq977IsLH725we1TKpyAaBCAFiJ5yTQ
         ytDjfTTCIMhsA==
Date:   Tue, 29 Aug 2023 00:10:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] I2C: ali15x3: Do PCI error checks on own line
Message-ID: <20230828221035.t6jshaqpknd4ivzw@intel.intel>
References: <20230827133705.12991-1-ilpo.jarvinen@linux.intel.com>
 <20230827133705.12991-6-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230827133705.12991-6-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ilpo,

On Sun, Aug 27, 2023 at 04:37:02PM +0300, Ilpo Järvinen wrote:
> Instead of if conditions with line splits, use the usual error handling
> pattern with a separate variable to improve readability.
> 
> No functional changes intended.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

> ---
>  drivers/i2c/busses/i2c-ali15x3.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index cc58feacd082..0231c5be6354 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -165,14 +165,15 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  	}
>  
>  	if(force_addr) {
> +		int ret;
> +
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
