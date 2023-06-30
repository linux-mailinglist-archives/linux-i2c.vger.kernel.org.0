Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77593743656
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 10:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjF3ICI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 04:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjF3ICF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 04:02:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BD8297B
        for <linux-i2c@vger.kernel.org>; Fri, 30 Jun 2023 01:02:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC42D616D6;
        Fri, 30 Jun 2023 08:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723B1C433C0;
        Fri, 30 Jun 2023 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688112123;
        bh=jn79D4qvuULmsRPzEV+TN+Mak4KIj3BN/Rf0XDYSz6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPRBAGNkpyDopF4uNHu9PcP3mOARvWS4mNLQlxp1IqUDeCIVyn7Xa/wot0jW7RNtv
         ZgJUiOVSiwMTSN935NmhWvybiOSc5HdGCcMABYhKaF1QTV2E3RBtbboqeQBFj2NnAl
         eSw0GqCFHn0szg/oVGRPQL+kG1YpbfBJ9pbmj6bMsqxJliNOgQTtAtk+eteN+5p+x7
         H3k39aOipxO6Zi3aq0gKA8Zo828uHxJCUsSxc68w8k9Dg3HFjJUdXASBS4aByEgGC8
         zUgceyns5Sxyvzd4JEFpc7qjevf+Bk1jwVmuQmIpBmwMgR8hNXIXiXwB/i0mLxsU35
         /AxjdF0GVfUTA==
Date:   Fri, 30 Jun 2023 10:01:59 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     ZJVcNIDWEbB6Jq7a@shikoro
Cc:     Wolfram Sang <wsa@kernel.org>, krzk@kernel.org,
        TonyWWang@zhaoxin.com, cobechen@zhaoxin.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230630080159.wvt5loiq66tuo24z@intel.intel>
References: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
 <20230614094858.317652-1-hanshu-oc@zhaoxin.com>
 <ZJVcNIDWEbB6Jq7a@shikoro>
 <a12f9bb4-835f-ea18-307f-4aa5ce36f61c@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a12f9bb4-835f-ea18-307f-4aa5ce36f61c@zhaoxin.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

> > > + * registers
> > > + */
> > > +/* I2C MMIO Address Constants */
> > > +#define ZXI2C_CR_L                     0x00
> > > +#define   ZXI2C_CPU_RDY          BIT(3)
> > > +#define   ZXI2C_TX_END           BIT(2)
> > > +#define   ZXI2C_RX_ACK           BIT(1)
> > The register layout looks similar to the i2c-wmt driver. Could this
> > driver maybe be reused for your hardware? I'll stop reviewing here
> > because we need to have that clear first.
> > 
> > Thank you and happy hacking,
> > 
> >     Wolfram
> > 
> 
> I just learned that they are indeed derived from the same VIA I2C IP.
> The relationship between WonderMedia/VIA/Zhaoxin looks like this:
> * The i2c-wmt.c driver is used on the WonderMedia/VT8500 platform,
>   an ARM-based SOC from VIA. This SOC hasn't been updated in years.
>   Its MAINTAINERS are also Orphan.
> * Lots of VIA IP is now owned by Zhaoxin, including I2C, SMBus, etc.
>   Zhaoxin adds some new features on the basis of the original I2C IP,
>   such as FIFO mode. And there are plans to continue adding new
>   features.
> 
> Based on this information, we thought it might be more maintainable
> to create a new driver file.

I think I commented about this some times ago but then forgot.
The two drivers are, indeed, very similar.

We could eventually create a *-common.{c,h} file.

Andi
