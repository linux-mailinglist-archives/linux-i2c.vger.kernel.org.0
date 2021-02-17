Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DF831D6B8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 09:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhBQIma (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 03:42:30 -0500
Received: from smtp1.axis.com ([195.60.68.17]:24672 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhBQIm3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Feb 2021 03:42:29 -0500
X-Greylist: delayed 575 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Feb 2021 03:42:27 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613551348;
  x=1645087348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F8vZxAEmte+jbew9PFlKUPYh3emsMfZMkNAme23J2xE=;
  b=hSJZqbcyFY/up84P8j8sDt1Mk3Z0+TlAqnJTU0oRKeJzCIHPeDj3IHIi
   13h/qnB2Yf9vBHEnjy31zG90RbiEXrMh+LyYshUsr2Qv1zYSOqlff6fk/
   /hIZhPMRzq3tR7yUROGjth0RHGeEo7yb+VDoQAfE1HaXXqcx4Yf/vxsOa
   w7yCH5w3lHsBydBuZQPG2rm5jizwvIweHrJzHbP63vuj4q7ZqpAInDlrn
   Q8QD4SRbjwFVSWA2tpgqSpXePF0F2W2mixqwrIbh3IraZ8ScpWMWNMtJR
   IIYkvw19KuPAjhOtMIvUSI6Z9SzJqdnKuQcigJq0t207W7aziWZ0ulnnJ
   w==;
Date:   Wed, 17 Feb 2021 09:32:11 +0100
From:   Jesper Nilsson <jesper.nilsson@axis.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Preserve high speed master code
Message-ID: <20210217083211.GN30470@axis.com>
References: <20210215190322.22094-1-marten.lindahl@axis.com>
 <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
 <20210216220933.2wzmft72bhjptzl3@axis.com>
 <20210217080747.a7nqzbotszwlb3dd@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210217080747.a7nqzbotszwlb3dd@kozik-lap>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 17, 2021 at 09:07:47AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Feb 16, 2021 at 11:09:33PM +0100, Marten Lindahl wrote:
> > > Any reason why not "|= MASTER_ID(i2c->adap.nr)" here instead of more
> > > expensive IO read? It's quite important because your current code will
> > > bitwise-or old I2C slave address with a new one... This should break
> > > during tests with multiple I2C slave devices, shouldn't it?
> > > 
> > 
> > You are correct. It is better to use the macro instead, and yes,
> > safer too. I only have one device that supports high speed i2c, but
> > I get your point. It could potentially break.
> > 
> > > On which HW did you test it?
> > 
> > I used an Artpec development board as master and INA230EVM board
> > as slave.
> 
> Artpec development board with? What SoC?

The ARTPEC-line of SoC:s are Axis Communications own ASICs, in the latest iteration
it's a Cortex-53 and includes instances of the exynos5 HSI2C ip.

> Best regards,
> Krzysztof

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
