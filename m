Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A79C73E650
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 19:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjFZRVt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 13:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbjFZRV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 13:21:28 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F2326BD
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 10:20:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4FEE321855;
        Mon, 26 Jun 2023 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687800041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E9wd5xIBTpleHeN9VsJBKRlqB61iDLsiEf0DG1HrMTg=;
        b=HP89bGsaxjWBaMhTBb/QV+Gbem3VR7orfaf1l0JjEDDrs4VsVOCTYFadBzsGTrPoBN7e7H
        jL29qGf/wDlXaEHPTacfjeT2/ZV+DJ19Gi7mqDoUwqal34mPFjwcOUB5UMsxN+LIUG45O9
        4nFDj8vhR74zQx7KnszaSLHSq7Wmbl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687800041;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E9wd5xIBTpleHeN9VsJBKRlqB61iDLsiEf0DG1HrMTg=;
        b=X/I4VQlfbjz6pB4HY2HnAjUntW6z3u75eK0yQMHC2QMn0yd2LdbMgYU1ux3RM9d76QkEGg
        BCy2rwXkWwdAMmCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26C4813905;
        Mon, 26 Jun 2023 17:20:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id e2jFB+nImWQkWAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 26 Jun 2023 17:20:41 +0000
Date:   Mon, 26 Jun 2023 19:20:39 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
Message-ID: <20230626192039.315cacce@endymion.delvare>
In-Reply-To: <20230614222439.i7uw3dai3why7bk2@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
        <20230614222439.i7uw3dai3why7bk2@intel.intel>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi, Heiner,

Adding Wolfram Sang who introduced the i2c_mark_adapter_suspended() API
originally.

On Thu, 15 Jun 2023 00:24:39 +0200, Andi Shyti wrote:
> On Sat, Mar 04, 2023 at 10:31:23PM +0100, Heiner Kallweit wrote:
> > When entering the shutdown/remove/suspend callbacks, at first we should
> > ensure that transfers are finished and I2C core can't start further
> > transfers. Use i2c_mark_adapter_suspended() for this purpose.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index ac5326747..d6a0c3b53 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
> >  {
> >  	struct i801_priv *priv = pci_get_drvdata(dev);
> >  
> > +	i2c_mark_adapter_suspended(&priv->adapter);
> > +
> >  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> >  	i801_disable_host_notify(priv);
> >  	i801_del_mux(priv);
> > @@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
> >  {
> >  	struct i801_priv *priv = pci_get_drvdata(dev);
> >  
> > +	i2c_mark_adapter_suspended(&priv->adapter);
> > +  
> 
> is this really needed in the shutdown and remove function?

The very same question came to my mind. I would really expect the
driver core to do all the reference counting needed so that a device
can't possibly be removed when any of its children is still active. If
that's not the case then something is very wrong in the device driver
model itself, and I certainly hope that the proper fix wouldn't be
subsystem-specific and implemented in every device driver separately.

FWIW, I see 13 I2C bus drivers calling i2c_mark_adapter_suspended() at
the moment, and only one of them is calling it in shutdown
(i2c-qcom-geni). None of them is calling it in remove. If that's not
needed for other drivers then I can't see why that would be needed for
i2c-i801.

As far as the remove() path is concerned, my expectation is that if
everything is undone in the opposite way of the probe() path then
everything should be fine. It turns out this is not the case of the
current i2c-i801 driver. The original HSTCNT register value is being
restored too early in i801_remove(). I'm to blame for this, the bug was
introduced by commit 9b5bf5878138 ("i2c: i801: Restore INTREN on
unload") which is mine. This should be fixed separately before any
other change.

Once this is fixed, unless you are able to actually trigger a bug in
the remove() path, then I see no good reason to add
i2c_mark_adapter_suspended() to that code path.

For shutdown, I'm unsure. Wolfram, what's your take?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
