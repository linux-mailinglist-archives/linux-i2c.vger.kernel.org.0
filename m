Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E407F1A34A6
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 15:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgDINQB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 09:16:01 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44211 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgDINQB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Apr 2020 09:16:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id h11so3808272plr.11;
        Thu, 09 Apr 2020 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i8qLidDf4LUpcOzJlNZoOnQbZ15pPTTrp1eBbk9aLvs=;
        b=Jns0a8t7+fzVa/lAxcxEuE8EvRYo34PI1p/IIP/GA2ZYubSrZ4j7kHkBV7WwUrnaWj
         CjR2yZBEhW5WybC9NZLiJJM6aiQIlym15yprkXbMc5+CBc1xWtC7z9Rg/YO967uMYzYZ
         4qBrmtmJTZzxxnyghu4gHk4n7vBf7IuFFzF2wEbaWTfaIRDhof5cEoR+5KsO+9jn2Qh7
         GKAeSjigziaAYJnulwrzPmTVaCLqRzlen/iiQvZN4wg03zXRA0Xo1Fd1uQKzSwPIbFai
         zvl2lXN4rnq+tRIDLmTgaP6TfA2/2q25BOII4S+V1yyr9P5T+uaXwk6rn5KgIzjVSE3o
         h4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i8qLidDf4LUpcOzJlNZoOnQbZ15pPTTrp1eBbk9aLvs=;
        b=AKcFaXhH7sQ25zTeTvzWF+5+2jTSWw/Kdzebzt/cJKc5DiCZK/3QdcYW6I/pYlaasU
         pmJpTLfgo+8Jcg8kyU4Afqui2Ar5JUODH4n/p3hO7FvzqmwadNwQjWuqQTf4sq2MAwe8
         4PuYmoAdEO1alqpT3fKso1PL2qdactEv/uGzwMkP1jsXvDYgsH22mNe5CWHBdMwP5j0u
         vjMbXy8adP1646RXBf9A3tVO7rZWfgYLxnLUSEr8MiIiEc6H1R1qn5J3aa+PpXpzQMz6
         ZyPVh4+tDXVI0Q/9tL3Tgl3IqySFzF+YF0Hi0fmeOcGtxCe/7DWIlyLQ1IIYnBnxVBx1
         WesQ==
X-Gm-Message-State: AGi0PuYK4fcSBLDtjDL8mTwcG81z3SuwwSycb64830Nmp6fDRzMUOHyQ
        /YNr6A++MbBh7iVbA25GSZY=
X-Google-Smtp-Source: APiQypKvVmzycPqbOZsJkUD2nXaOhlcJllxCOtUp9WHMCGJjFE0o1SziQldVENrM/1PHsSoMhIW7ew==
X-Received: by 2002:a17:90b:2352:: with SMTP id ms18mr10463821pjb.97.1586438160532;
        Thu, 09 Apr 2020 06:16:00 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id i8sm1014564pfr.138.2020.04.09.06.15.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Apr 2020 06:15:59 -0700 (PDT)
Date:   Thu, 9 Apr 2020 21:15:57 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/24] convert to devm_platform_ioremap_resource
Message-ID: <20200409131557.GA6328@nuc8i5>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
 <20200408195232.GB22619@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195232.GB22619@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 08, 2020 at 09:52:32PM +0200, Wolfram Sang wrote:
> 
> > v1 -> v2:
> > 	- delete 4 patches of can not be sent by gmail server.
> 
> I asked you to squash all these patches into one when resending.
>
Wolfram, I am so sorry for that, I missed your suggestion yesterday,
I will send patch v3 and squash all patches into one. sorry!

BR,
Dejin

