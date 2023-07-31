Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3EE376A46C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 01:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjGaXBt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 19:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjGaXBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 19:01:48 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA62810FE;
        Mon, 31 Jul 2023 16:01:46 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RFDJT1NmgzCY;
        Tue,  1 Aug 2023 01:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1690844505; bh=coqy55HefL/fdeEF6y/6iJl2PiJntoSRxKXFxaiXquI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IvFhlDJluxwsMCw2RZplNa9mCAeTUF9ac8QKHcWPVUHyEpQzWsB/oUYg4mr5tJGp2
         Hcmk5Y53yIJVQyA9kanW2SAqoc9JWrI6wzYytBigvNrPqfgLb1AV8LfXTRj/YVT3pB
         W4Kh4BOBgKNUzSwzaZHOrZv0CjJw1f/Oy0QoSI7RACQk49kN7x2hLJjaz5lvMpnukF
         vvfnlaQr/GHcOZ9prIkuGxQw4bHhwRJiZW+U48u7bmLHyTiaW2qk83u84Xm0UUEhiu
         J4bBx4yH0fBJd1sJYrJwwter6yXc46Q3huziYRzpXAJWaLlT1pQG5Nlri7afSJeuV1
         DfTKYXy5e92xw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Tue, 1 Aug 2023 01:01:43 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <ZMg9VwKxXBm94YRl@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <20230730202507.ojwinyjsx7ygyavp@intel.intel>
 <ZMbgIovV7lxlgd5T@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMbgIovV7lxlgd5T@qmqm.qmqm.pl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 31, 2023 at 12:11:47AM +0200, Micha³ Miros³aw wrote:
> On Sun, Jul 30, 2023 at 10:25:07PM +0200, Andi Shyti wrote:
> > On Sat, Jul 29, 2023 at 07:08:57PM +0300, Svyatoslav Ryhel wrote:
> > > +static int i2c_hotplug_activate(struct i2c_hotplug_priv *priv)
> [...]
> > > +{
> > > +	int ret;
> > > +
> > > +	if (priv->adap.algo_data)
> > > +		return 0;
> [...]
> > > +	ret = i2c_add_adapter(&priv->adap);
> > > +	if (!ret)
> > > +		priv->adap.algo_data = (void *)1;
> > 
> > You want to set algo_data to "1" in order to keep the
> > activate/deactivate ordering.
> > 
> > But if we fail to add the adapter, what's the point to keep it
> > active?
> 
> The code above does "if we added the adapter, remember we did so".
> IOW, if we failed to add the adapter we don't set the mark so that
> the next interrupt edge can trigger another try. Also we prevent
> trying to remove an adapter we didn't successfully add.

Maybe the function's name is misleading? We could find a better one.
Activation/deactivation in this driver means "initialize/shutdown the
hotplugged bus" and is done in response to an edge (triggering an
interrupt) of the hotplug-detect signal.

Best Regards
Micha³ Miros³aw
