Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8522A394040
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbhE1JqK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:46:10 -0400
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:42716 "EHLO
        6.mo173.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbhE1JqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 05:46:10 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 May 2021 05:46:10 EDT
Received: from player759.ha.ovh.net (unknown [10.108.16.164])
        by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1531B16FF37
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 11:37:28 +0200 (CEST)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player759.ha.ovh.net (Postfix) with ESMTPSA id 0A6AD1E9C0EEA;
        Fri, 28 May 2021 09:37:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005391c78f5-e324-45d6-9fc9-07c32e8dea38,
                    89C895FB1C287AD55CC827FF2C9DBB51EF365142) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: convert to the
 json-schema
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
References: <20210512160750.15183-1-zajec5@gmail.com>
 <1620844516.523024.204087.nullmailer@robh.at.kernel.org>
 <YLC2en7Mj7kurlCd@kunai>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <80afe993-68f2-01f1-a13e-319a6ec32169@milecki.pl>
Date:   Fri, 28 May 2021 11:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YLC2en7Mj7kurlCd@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13391172020351241921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekjedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefheenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepheevleelgfejgfdttdelieejgeduffehjeduffegiefghfejlefgveelgeehkeeinecuffhomhgrihhnpehoiihlrggsshdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28.05.2021 11:23, Wolfram Sang wrote:
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.example.dt.yaml:0:0: /example-0/i2c@18008000/wm8750@1a: failed to match any schema with compatible: ['wlf,wm8750']
> 
> A generic question:
> 
> So sound/wm8750.txt was not converted yet. However, if this conversion
> is fine otherwise, I'd vote to apply it nonetheless because it is one
> conversion less to do then. Alternatively, we could change the example
> to include a simple EEPROM which has an already converted binding doc.
> 
> What is the procedure here?
> 
> All the best and thanks for your work!

Let me try to answer this based on the discussion in the:
[PATCH V3 robh dt/next] dt-bindings: mfd: add Broadcom CRU
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210519184041.563-1-zajec5@gmail.com/


Rob has stated he doesn't want maintainers to apply bindings that
introduce documentation warnings/errors:
https://patchwork.ozlabs.org/comment/2687693/

Lee Jones as MFD maintainer says it's wrong:
https://patchwork.ozlabs.org/comment/2687847/


I've already got wm8750 YAML binding queued for the 5.14, see linux-next:
ASoC: wm8750: convert to the json-schema
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=11480dbfe1d59eaa6382864acc476e7621b1da4c

Personally I think it's a bit too paranoid to reject such a patch if we
have a proof that its dependency is already part of the linux-next. If
you agree with Rob however I'll just resubmit this very same patch once
Rob updates his tree to the 5.14-rc1 (once it's released). I still think
it just makes the whole process take unnecessarily long.
