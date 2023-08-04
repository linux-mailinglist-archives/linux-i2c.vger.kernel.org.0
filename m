Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8FFA770C7C
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 01:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjHDXp6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 19:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjHDXp6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 19:45:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AA23AAF;
        Fri,  4 Aug 2023 16:45:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B35186217A;
        Fri,  4 Aug 2023 23:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282BC433C8;
        Fri,  4 Aug 2023 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691192756;
        bh=dMBsnf7UVFGyJspGf+fmvKXjCVkmWyeAS8rDN2tPz/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pmY7MD90OJcgP5sniA1hTm7IbuLT54Ol4h94HMC4LBIr1ZpdVPwxB9g7omT0er3p4
         UxyDAknlzxLaOFHqUSE1vyBQW8YgS3M72WNbprkGHZWqIYz1AxNZJew64vNMktqJdX
         XAD7c6rSLvW0tzLREevadkAfHaldgnbuxzQxMN6Io8gblPbVL1kfIL6bhb66E7UNag
         jDGT1trq+xSPnLWqFQwr9wLZPl0mYmANficejs3+FwpiFsq3mDW3ow6cbUkgAldtXf
         JkiSEY8n+x+8koeemZxXJHkPbEzAinL5bKrXUz9LVB8KJ6q1RM6lzPqr1jlYwt9Tq4
         aq+F4/GBeBeHg==
Date:   Sat, 5 Aug 2023 01:45:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <20230804234553.3egec5i5tyfyg4hz@intel.intel>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <20230730202507.ojwinyjsx7ygyavp@intel.intel>
 <ZMbgIovV7lxlgd5T@qmqm.qmqm.pl>
 <ZMg9VwKxXBm94YRl@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMg9VwKxXBm94YRl@qmqm.qmqm.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 01, 2023 at 01:01:43AM +0200, Michał Mirosław wrote:
> On Mon, Jul 31, 2023 at 12:11:47AM +0200, Michał Mirosław wrote:
> > On Sun, Jul 30, 2023 at 10:25:07PM +0200, Andi Shyti wrote:
> > > On Sat, Jul 29, 2023 at 07:08:57PM +0300, Svyatoslav Ryhel wrote:
> > > > +static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)
> > [...]
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (priv->adap.algo_data)
> > > > +		return 0;
> > [...]
> > > > +	ret = i2c_add_adapter(&priv->adap);
> > > > +	if (!ret)
> > > > +		priv->adap.algo_data = (void *)1;
> > > 
> > > You want to set algo_data to "1" in order to keep the
> > > activate/deactivate ordering.
> > > 
> > > But if we fail to add the adapter, what's the point to keep it
> > > active?
> > 
> > The code above does "if we added the adapter, remember we did so".
> > IOW, if we failed to add the adapter we don't set the mark so that
> > the next interrupt edge can trigger another try. Also we prevent
> > trying to remove an adapter we didn't successfully add.
> 
> Maybe the function's name is misleading? We could find a better one.
> Activation/deactivation in this driver means "initialize/shutdown the
> hotplugged bus" and is done in response to an edge (triggering an
> interrupt) of the hotplug-detect signal.

So that algo_data is randomly chosen as a boolean value given the
fact that this particular driver doesn't have its own algorithms
but it's using the ones from the parent. Right?

If so, can we have a different and more meaningful boolean value
for this?

And... thinking aloud... are there race conditions here? I
mean... you can't attach two docking stations, but are there
other scenarios?

Thanks,
Andi
