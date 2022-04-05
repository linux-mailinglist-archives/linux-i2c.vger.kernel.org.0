Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD01C4F48F2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237931AbiDEV4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446270AbiDEPoY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 11:44:24 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47E6E5422;
        Tue,  5 Apr 2022 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649167978;
  x=1680703978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5sGyUtmpaFkWRCk21ervBjRMAqQ7AxnaRPhDX0qS5g=;
  b=dZoPFMF8g256+wra+B7N20Ypk9LoSdHpce9+eZlshnucG8nmourdKN6j
   duC74Tq5GQmlMLEqZJTWxE8QiIu+LCIIG6TUI5B82eLwxTKfM/ADPKl64
   XBUwdLnDLIMxgcXBTWoRSTDyS/e7mD1MqAF7kEm0kjsgx2t7iEWnAawT2
   8R/Ccw6JTGf78dtWTei1os64uKQ03zt2+krHMR1VMTH53HCtwheVFO7i6
   XWZwEDibVlhlOFAq6N4DHqX0eq2ccT8+kRHgVZ/XDCa6CU8f7AB8l5zhH
   j4N0N/4U/TdyP5qxbSSarhzzfPpG/kuD6G6CXrzSpuIGOPdNitjtY4gR4
   A==;
Date:   Tue, 5 Apr 2022 16:12:55 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: add binding to prevent device detection
Message-ID: <20220405141255.GD28574@axis.com>
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
 <20220405121627.1560949-2-vincent.whitchurch@axis.com>
 <e3247f0f-5d3d-d981-699e-7dcedb30f881@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e3247f0f-5d3d-d981-699e-7dcedb30f881@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 05, 2022 at 03:57:16PM +0200, Krzysztof Kozlowski wrote:
> On 05/04/2022 14:16, Vincent Whitchurch wrote:
> >  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
> 
> Use the subject matching the subsystem (git log --oneline -- .......).

I did look at the git log when writing the subject, but there's a bunch
of variation there so I went for the subject prefix which Wolfram
himself used since I assumed he would be the one applying these patches.

$ git log -n5 --oneline origin/master -- Documentation/devicetree/bindings/i2c/i2c.txt
6881e493b08f dt-bindings: net: New binding mctp-i2c-controller
168290fb2675 i2c: add binding to mark a bus as supporting SMBus-Alert
e6277308ac21 i2c: add binding to mark a bus as SMBus
db36e827d876 dt-bindings: i2c: add generic properties for GPIO bus recovery
fad5972a1eca i2c: add 'single-master' property to generic bindings

> 
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> > index fc3dd7ec0445..5f7bdf4851e8 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
> >  	this information to adapt power management to keep the arbitration awake
> >  	all the time, for example. Can not be combined with 'single-master'.
> >  
> > +- no-detect
> > +	states that the system should not attempt to automatically detect
> > +	devices which are not explicitly specified as child nodes.
> 
> Focus on the hardware, not on system and behavior. The hardware property
> is that bus is completely described in Devicetree or detection does not
> work correctly. I guess the property name could stay like this, but the
> description could be rephrased.

I'm having a hard time drawing the line between hardware and the
"system" here.  The bus being completely described in devicetree doesn't
sound like a hardware property to me, but, yes, I can change the
description to say that.
