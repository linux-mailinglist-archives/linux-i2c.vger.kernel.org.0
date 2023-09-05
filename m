Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A0A792739
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbjIEQUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354010AbjIEJMG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 05:12:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31FED8
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 02:12:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BDE42B8107E
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 09:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2D6C433C8;
        Tue,  5 Sep 2023 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693905120;
        bh=sL+SnhcA/HTshmNi/fOceTzWKj3hg1JZb0abvH3WQoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BtjRA65qRME/qBMDwNc338xJyfyR+WLXpVtRghMQ80X3VxiCB1Q3Y6CqnseYY/wFv
         gPls2lB7fFVFAWJz5XD74wwgfy101gbJjwQDmnYy8FjACiWO3sM5ReJfjXuqtwZ0xr
         RAclpJaoDlf99VKOUA3QCJSspW2e0QNp2u6ruYEcxWKtfpacXF0pW2+ImbUbL3oB/h
         9nXX9U4GfDUw2MG+Ri8RQtUzN3kfAxSl9xcSu7VKAECC7fjK3t8mYbt1UJeu/9qPnJ
         IDgA3YnseFyhYu1T4q25y86zToQPc4n5kdj+gEKmsvrhSLoVuC971FtbIW7j8UQe4g
         ltWLBVU7d7BzA==
Date:   Tue, 5 Sep 2023 11:11:55 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230905091155.h3oezdj5g6z5jpxu@zenone.zhora.eu>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
 <20230905101243.39920fe5@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905101243.39920fe5@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Tue, Sep 05, 2023 at 10:12:43AM +0200, Jean Delvare wrote:
> On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:
> > Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> > receiving the last byte. If we get e.g. preempted before setting
> > SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> > before SMBHSTCNT_LAST_BYTE is set.
> > Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> > SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> > is also consistent with what we do in i801_isr_byte_done().
> > 
> > Reported-by: Jean Delvare <jdelvare@suse.com>
> 
> Note for Wolfram: checkpatch says we should insert here:
> 
> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/

does this also need a Fixes: tag? I tried to check it, but there
was an intricate jungle of commits in these lines.

Anyway, you can add:

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
