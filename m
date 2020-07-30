Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBA1232910
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgG3Anb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgG3Ana (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:43:30 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D383C061794;
        Wed, 29 Jul 2020 17:43:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q4so27054835lji.2;
        Wed, 29 Jul 2020 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hrd/sVVbKRv6h5dpxseIhAUo32QAsCOmdQZx4X9C3no=;
        b=P0OX91nTqbPspSBtwOZVQ3guP5eiSZJC2M19r/UGpT4KhBifEfQCQ9z8MVbZMSe/Ok
         raCasPqFLOfTbiWc+uPWD8CE3g0x1AWj37Pe7HW8eNXW0MxvgTIXwkdjq9Z3g/hNP9b+
         D+6zyWwMq5C3XQbI1T/9ZXL2qxmFor33tuqlMEdWmjzfUlG01YpSMIVQV2HHpkvF8iPn
         lk2WBwfUTTd3fWMS11MEFZA9bLJIyrOtQXrqndX9yuUmO6O8/vTBQipK53MENdIaaGIW
         q3qvwjqx0Kr0aOaogBHXa/L2GvzgyXUWiF9LipkR0foKIHXuo0Y8xaaVt8izMK9J9R+m
         UUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrd/sVVbKRv6h5dpxseIhAUo32QAsCOmdQZx4X9C3no=;
        b=n6VX4jPGpcWalcT3rCmgbl+7YgN3d5iq4T20oEo0di6QMpcBjSpxBy6JhCJ/INVvIb
         eV2fwpf3m9R/52bUv2ndQlFRv1bIv5Jh6ipc+330rGNlOTe1pNDCAz+UeN0LTvTM7vm1
         580BSTDA2o4eE1kx8SgkDKyBpOXZBEf3Mn3kVScFfhSDD2S0+A2DlmyYr+a61pNEHvpT
         6fJEpq/mN3ZOWus0wueqhii8xB6xg4zDPhNPe32uN4tGDTiit9sUSib1XC/4bmhJwRFH
         ZKO/vVLD9txdoRyZJmKpeOStD3C+UX9PrruRUQM0gWUAZtwvWj7DfNjBQ2zJcCmYJYO/
         Xb7Q==
X-Gm-Message-State: AOAM532v4vUt8J3uctbmWY8DWQHSgyX5n+B5JQMiq9XpRdisxNu2W9po
        s6GLQIhxyHY9S0PfiLlkRJWrR/HC
X-Google-Smtp-Source: ABdhPJyiMUIZNIERHZwVbH1z2zo3M9gskdrosLEziaNIVKnn3UPRV+fACPP07e5h5ftb9Zj9QIdVDA==
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr184858ljm.249.1596069808456;
        Wed, 29 Jul 2020 17:43:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id y1sm961104lfb.45.2020.07.29.17.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 17:43:27 -0700 (PDT)
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
 <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
 <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
 <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
 <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
Date:   Thu, 30 Jul 2020 03:43:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.07.2020 03:27, Sowjanya Komatineni пишет:
...
>>> Secondly, perhaps a failed calibration isn't a very critical error?
>>> Hence just printing a warning message should be enough.
>>
>> Using dev_err to report calibration failure. Are you suggesting to use
>> dev_warn instead of dev_err?

I meant that failing s_stream might be unnecessary.

The dev_warn should be more appropriate for a non-critical errors.

>>> Could you please make a patch that factors all ON/OFF code paths into a
>>> separate functions? It's a bit difficult to follow the combined code,
>>> especially partial changes in the patches. Thanks in advance!
>>
>> what do you mean by partial changes in patches?
>>
>> Can you please be more clear?
> 
> Also please specify what ON/OFF code paths you are referring to when you
> say to move into separate functions?

I meant to change all the code like this:

set(on) {
    if (on) {
       ...
       return;
    }

    if (!on)
      ...

    return;
}

to somewhat like this:

set(on) {
    if (on)
      ret = enable();
    else
      ret = disable();

    return ret;
}
