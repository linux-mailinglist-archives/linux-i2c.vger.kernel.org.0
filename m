Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D0E232322
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 19:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2RIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 13:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2RIJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 13:08:09 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D188C061794;
        Wed, 29 Jul 2020 10:08:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f5so25852477ljj.10;
        Wed, 29 Jul 2020 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kdm+mgqvwV7CVf+Pvs1UK+aKOAgvVAj+fT+AGl9gU/o=;
        b=R3pBUmaqToAvUXZH5tAeJ79vR2bK59XOrW1Pa/E6R1a4Wh7fwhrJ5ZwNnG4J4svnaO
         o5o/tb/6pZ+H8jUY3rLNE/hGK2hKFu4P282EQGgk0U0UuUyIZSxdijncXnxgRx+J28hM
         JWiUL6fnheSuk/8ZLzTDgui69PyMDaVxQM31gxngUPALVcpGxWMbstWCVulOhLOnPPa+
         EiiL9At+Pe6MtwLIyGrs6zPBG61Pq6keRFTjUmnXMwMwceNoQKfTdqYZT7IeuXvixuVo
         qqGZ/w6aPuOhE3R+bjeIP1fD2tYao3K8Lw9S786/4pytTN1bGM+2XYY1EKJudfhZWVVc
         i8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kdm+mgqvwV7CVf+Pvs1UK+aKOAgvVAj+fT+AGl9gU/o=;
        b=JHYtaU617K4oJHN37V79e6m+BQZu7A84cGXxrVQ23GsPidHsXSplFazq/fR7YGi4K0
         C2cBZwvcfsqBj6ET2gTzXHLQezuq4MLP+rQ5WED/Wqk748D8/2+jF2hEEItPNdHquxHM
         Pbh62vJPpuMMhRKLQGKAsDnDfhN2MAf5wnXvTsdVicr8PnYnBSUDDoO9VBsbFunXebzF
         TLNaZIyWhA9gr63XMYHxIxjaOsqjD5vgzeC15XFPCu78Pi8iyfunnxlhvHcorl2VPWAo
         5hrvXByNxuCXWXdIjLb/qYchw6IgGP7ULF8DBhjdaFxZlDgOsNLiKoE5TqExjIcNPwpm
         O6HQ==
X-Gm-Message-State: AOAM532nJtZbU06wbnvOJM3tvO/jsq+sSdbTvDbFf3Nia8EnlD8QBWhX
        ud5gQGKOCw6Er1Fdx2tF1pxefKlS
X-Google-Smtp-Source: ABdhPJxZZPDDdtZSLDx1sPcvKxSlR6GIhIb8gtqrr7AXluJlgMFp6LEauw/Lo1ppkp1hv0BmrPW3Cw==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr1664078lji.378.1596042487460;
        Wed, 29 Jul 2020 10:08:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id z25sm498374lji.33.2020.07.29.10.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 10:08:06 -0700 (PDT)
Subject: Re: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
 <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
 <69903c67-8e5f-11c2-45ec-c76b97634aba@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d291d306-55d4-2264-dc05-0e47f0dfef20@gmail.com>
Date:   Wed, 29 Jul 2020 20:08:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <69903c67-8e5f-11c2-45ec-c76b97634aba@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

28.07.2020 19:04, Sowjanya Komatineni пишет:
...
>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>> +{
>> Doesn't MIPI_CAL need to be reset here?
> No need to reset MIPI CAL

Could you please explain why. There is a calibration state-machine that
apparently needs to be returned into initial state, does it return by
itself?

TRM says that MIPI block needs to be reset before of starting
calibration process. The reset is completely missing in the driver, I
assume it needs to be corrected with another patch.
