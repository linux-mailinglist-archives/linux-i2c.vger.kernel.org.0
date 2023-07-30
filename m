Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1B0768906
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 00:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjG3WLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 18:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjG3WLx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 18:11:53 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60A510D5;
        Sun, 30 Jul 2023 15:11:48 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RDbFH2dQpzBg;
        Mon, 31 Jul 2023 00:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1690755107; bh=XeiZSisA1teraNfcUk/a3LOgtrVOqBrf3jTR2Qc7bJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PRu1PhNxXlz0lKRxHQBH57tTm9vhI1meIw/X/0z9+rwMa/1Itt2sVuWyqJwKMk6xJ
         7deONlOh/QN5k9fQyaEKNY7MUQVacCRyAsGF2a64xcAngC1CcPn3LGP4dH7d9up7Gu
         lN5HFn4UzK4bTkTksfhnUyUeYym1jmyYGqgzCDhhom7BrdE4iQZAsMUQb6MghG6GK4
         laFh4svpIJJ/N9aUd6wZTprliZpbKa9JrsheelzhQvwHs2n0ScQwhFtxGeSvhqSyqL
         5VvadZjCWu2WBSjANsJMyJOVrV7s235+w6d4Aa0OfS9iM3oIUhuQR9L/UO8BmwQpQF
         PIctLvor/LDew==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Mon, 31 Jul 2023 00:11:46 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <ZMbgIovV7lxlgd5T@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <20230730202507.ojwinyjsx7ygyavp@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230730202507.ojwinyjsx7ygyavp@intel.intel>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 30, 2023 at 10:25:07PM +0200, Andi Shyti wrote:
> On Sat, Jul 29, 2023 at 07:08:57PM +0300, Svyatoslav Ryhel wrote:
> > +static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)
[...]
> > +{
> > +	int ret;
> > +
> > +	if (priv->adap.algo_data)
> > +		return 0;
[...]
> > +	ret = i2c_add_adapter(&priv->adap);
> > +	if (!ret)
> > +		priv->adap.algo_data = (void *)1;
> 
> You want to set algo_data to "1" in order to keep the
> activate/deactivate ordering.
> 
> But if we fail to add the adapter, what's the point to keep it
> active?

The code above does "if we added the adapter, remember we did so".
IOW, if we failed to add the adapter we don't set the mark so that
the next interrupt edge can trigger another try. Also we prevent
trying to remove an adapter we didn't successfully add.

> > +static irqreturn_t i2c_hotplug_interrupt(int irq, void *dev_id)
> > +{
> > +	struct i2c_hotplug_priv *priv = dev_id;
> > +
> > +	/* debounce */
> > +	msleep(20);
> can you explain this waiting and why 20ms?

It's an arbitrary time long enough to avoid having to handle multiple
on/off events that could happen when the dock is being inserted (ringing)
and short enough to not have to worry about the user getting impatient.

Best Regards
Micha³ Miros³aw
