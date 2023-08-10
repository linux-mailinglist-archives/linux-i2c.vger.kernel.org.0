Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08837783D9
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 00:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjHJWzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 18:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjHJWzT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 18:55:19 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2583271B;
        Thu, 10 Aug 2023 15:55:17 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RMMhN09ZWz6r;
        Fri, 11 Aug 2023 00:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1691708116; bh=eOEuA6sgR+8B4fh+tPHMI/mk8SYjcZ9M0Lb23e/067o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xq+U8Ps78g3aysKn3IS1QNBfrye0dcTy/pRgxUBSXeSkTYUSyANppKykOaaga3T4k
         KNgsIZqK0ospe5znGC74RXSafBZqodrtN0Y5zLME6W/MoAOLnXI39AsJ7ep1fvdNdx
         2N7DFO5TsSXiTNxfE8y3grUlXlF/dxIiEfvrBHMIPdKrqusQuweVfWn9FMNLyjYN8t
         Fr1t8FfDP/+uektKOduHKiKdA8sehm903dQHcwE15azoKLnOKppRmaltvXi/bKu9+g
         tByEhfV63+2jhdzVaP6cF0AgY+kDuxoxjcbqQpzYLmy1Nt2r939TD/bESs5ncjfO10
         RNxzz7lywj9zA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Fri, 11 Aug 2023 00:55:14 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <ZNVq0prfCpQFm7RX@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <20230730202507.ojwinyjsx7ygyavp@intel.intel>
 <ZMbgIovV7lxlgd5T@qmqm.qmqm.pl>
 <ZMg9VwKxXBm94YRl@qmqm.qmqm.pl>
 <20230804234553.3egec5i5tyfyg4hz@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804234553.3egec5i5tyfyg4hz@intel.intel>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Aug 05, 2023 at 01:45:53AM +0200, Andi Shyti wrote:
> On Tue, Aug 01, 2023 at 01:01:43AM +0200, Micha³ Miros³aw wrote:
> > On Mon, Jul 31, 2023 at 12:11:47AM +0200, Micha³ Miros³aw wrote:
> > > On Sun, Jul 30, 2023 at 10:25:07PM +0200, Andi Shyti wrote:
> > > > On Sat, Jul 29, 2023 at 07:08:57PM +0300, Svyatoslav Ryhel wrote:
> > > > > +static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)
> > > [...]
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	if (priv->adap.algo_data)
> > > > > +		return 0;
> > > [...]
> > > > > +	ret = i2c_add_adapter(&priv->adap);
> > > > > +	if (!ret)
> > > > > +		priv->adap.algo_data = (void *)1;
> > > > 
> > > > You want to set algo_data to "1" in order to keep the
> > > > activate/deactivate ordering.
> > > > 
> > > > But if we fail to add the adapter, what's the point to keep it
> > > > active?
> > > 
> > > The code above does "if we added the adapter, remember we did so".
> > > IOW, if we failed to add the adapter we don't set the mark so that
> > > the next interrupt edge can trigger another try. Also we prevent
> > > trying to remove an adapter we didn't successfully add.
> > 
> > Maybe the function's name is misleading? We could find a better one.
> > Activation/deactivation in this driver means "initialize/shutdown the
> > hotplugged bus" and is done in response to an edge (triggering an
> > interrupt) of the hotplug-detect signal.
> 
> So that algo_data is randomly chosen as a boolean value given the
> fact that this particular driver doesn't have its own algorithms
> but it's using the ones from the parent. Right?
[...]

Not exactly.  There is an 'algorithm for this driver just forwards the calls to
the parent bus and has no use of the algo_data field.  The field is thus
used to store a flag noting whether the child bus was registered or not.

> And... thinking aloud... are there race conditions here? I
> mean... you can't attach two docking stations, but are there
> other scenarios?

The driver depends on I2C core code synchronization (e.g. i2c_del_adapter()
waiting for ongoing transfers). Outside of probe/remove there is only
a single thread used by the driver: the interrupt handler.

While reading to answer your question I noticed that IRQF_ONESHOT can be
removed: if the thread picks up the signal then it atomically clears the
trigger flag; if another signal arrives before the handler is done,
handler will be called again.

Best Regards,
Micha³ Miros³aw
