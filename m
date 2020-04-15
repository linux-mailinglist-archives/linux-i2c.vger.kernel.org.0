Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2228B1A9AAB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408702AbgDOKej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408705AbgDOKeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 06:34:13 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAFCC061A0E
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 03:34:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so16817539wmj.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PTNilJgBZZhyWSgq5FQ4sgITJPwkD0fbyzKxpSApE9g=;
        b=Z40z8v7A93xbwxuDomrQ1jlZ+G1cx5ZSJ+kowcM3KaCigmBMo9/9LXdG9Cc9ECiiv4
         uaXolBMvj8X+3L/7OrJcsHjT4DcCPn1zVRMkENksxP4DgkBSVSmH6tJa+xhi0+hwXTLN
         Wy0erTwUemWru+RFm1/W0qL3DPqWvaqnKQdSiU3cUDuJQoU/F6zpKs+9DvTIu91ntF7M
         SGS1foepnmhRpTE4egC6jDeODRIF/hkO7eUYve1V3MoekXkyvZCActFRkx6Gc18V1+y7
         ndXf08u10868l5w+Axdrlp6BHHhD2Z/fCVwcK6Jk6XDeUIbwFr50d9obwFJ+gduNo7OY
         goLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PTNilJgBZZhyWSgq5FQ4sgITJPwkD0fbyzKxpSApE9g=;
        b=UsjU6rSuBTenik+UvGdZsWciuhhWSunu5Nx+EBuYsib4LNcV79rzC4erTfDh/fRS+b
         evCMpW7D+iWtIVgCiXLFt7PLoEFTZ31I4UFosQz5rfxoBRtUvszpSHKrI7XCzQ7MZw02
         cuhHWnC2z1tCjOEI3QssiyvXkANb4WOCItqe5b/FKO4GZpQO/XLB9yEQswO+FPA2uLxx
         wAeky3tbiavVrqCDjq4fyVozH31oyU+78TZ5sxMVGmgbfAIuV6b5Vl026d4D1fhVY73f
         4fAfqgUGFtQE+ZHbMlj1xwL2jlop1s7ANhs9qVC7eyQkAVvBl/9l93wdiGetT+kUA/fr
         psRA==
X-Gm-Message-State: AGi0Pub+fwUorHjQKsDvv6SSb41yKuT1tsHdy5xMHYJggNe8/0e9s+T9
        DzQ2cNZHqTdfIC7HIm8kQViWUg==
X-Google-Smtp-Source: APiQypKBXMSKkLl3vKZS5yoXgN9eV8pgAR0WguL01vf0LrSnHKFKhjDONkGJCVMXk1MVAgVMiRcXEA==
X-Received: by 2002:a1c:990d:: with SMTP id b13mr2392392wme.179.1586946848251;
        Wed, 15 Apr 2020 03:34:08 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id u7sm24319753wmg.41.2020.04.15.03.34.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 03:34:07 -0700 (PDT)
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Mark Brown <broonie@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
 <20200331112352.GB4802@sirena.org.uk>
 <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
 <20200407105542.GA5247@sirena.org.uk>
 <48c60fdf-03c6-650a-2671-b8f7cc1e5c82@codeaurora.org>
 <5644ef02-f984-0f5b-d745-eca3c9573726@linaro.org>
 <20200409132042.GD5399@sirena.org.uk>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <15799ba5-bcbf-92d9-ac2e-a8bea469d005@linaro.org>
Date:   Wed, 15 Apr 2020 13:34:05 +0300
MIME-Version: 1.0
In-Reply-To: <20200409132042.GD5399@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/9/20 16:20, Mark Brown wrote:
> On Thu, Apr 09, 2020 at 04:17:22PM +0300, Georgi Djakov wrote:
>> On 4/8/20 15:17, Akash Asthana wrote:
> 
>>> Can we centralize below logic of peak_bw selection for all the clients to ICC core?
> 
>> I don't think this is a good idea for now, because this is very hardware
>> specific. A scaling factor that works for one client might not work for another.
> 
> AIUI a driver can always override the setting if it's got a better idea.

True.

>> My questions here is how did you decide on this "multiply by two"? I can imagine
>> that the traffic can be bursty on some interfaces, but is the factor here really
>> a "random number" or is this based on some data patterns or performance
>> analysis?
> 
> The reason I'm pushing for this to go into the core is that the numbers
> seem to be just made up and not device specific at all (or at least
> there's a lot of devices with the same values).

I might be a bit too cautious here, but the main question is what this common
number should be then. Maybe the numbers are not device specific, but
communication interface/bus specific? I would rather make the peak 30% higher
than the average, but for low speed interfaces i guess the factor of two should
also be fine?

Thanks,
Georgi
