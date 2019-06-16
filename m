Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EA474DE
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2019 15:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfFPN4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jun 2019 09:56:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43608 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfFPN4U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Jun 2019 09:56:20 -0400
Received: by mail-lf1-f68.google.com with SMTP id j29so4643047lfk.10;
        Sun, 16 Jun 2019 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vUj7/cmqz5EsJjON5muTu2B1PksKipHdgkZedARaWAY=;
        b=EArIxiUtzwv4fAo+tQXYXVYXrYx2cB+95rmkMP1Sbun8BYAnoXJvcPNJ/+VqPFG7NV
         RPrMmnQO0vhs5xa32MLsOiZv0l8PCJ8cpaPqhI2flQWvJqgbAcTNjvAxCzSwYJ7Wnbqx
         8ME4LPcwqiU1sF5dW5bKJa8CbpWGd10FcE1NdAk1Pm89ovais6IaK27HFTgvojNoa2EO
         QqjQFZTrx+kRH6ptv+PeApRs4rUu/bYTsNRNgQyTuy/XQQ9r8N2WGQ10Vc93gmIwNN6j
         9+ef2fyP0GA5kaZ3bDgK4ygInimJmZAndBQWqnx2UA1K8ICDQQeW8AjiynhslUrERBml
         hJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vUj7/cmqz5EsJjON5muTu2B1PksKipHdgkZedARaWAY=;
        b=iMZ9D5coofBoyYdS1DlOfqWCsVtFs/pYbq7lUYLmQKO/dY3QuwzTkJrn6rXBKesw2b
         NofVkrvy5XxrFjWG5OmwtsAYQnsAPUIiE29tIxc/F5znb5D6ctgXLn3/1ns3ne5x86mc
         0oaIifEgbpJcY2X0LG2r8v7jLaeal1Rmt1lvHTMu7g0wQs5JmlEBUD0mftpCqRd1xfNQ
         rFRuzKSxcu1zdi/vsmT/XaduAmIZkDwZpIlz5QUkN3fCyRisABTybhZTUnzJwPiMIAOb
         Mf+FmYedxBxH7U+l1hv8oaUcSFw2F+Zbm44cR6m5ud2Xc+u1uUt7mip4qFsacrxKJzK4
         swaQ==
X-Gm-Message-State: APjAAAVxtX86D5HtiPl7YMQRnzeCY/DyyiFis/hvaX5BsPU4YtAVsaSf
        7utSn2xAiblI7FNDRCzYeoQ=
X-Google-Smtp-Source: APXvYqziCr78Zs5kDjI/NHZgifF4wyDPKUb+UgfVgT5G+4vXttuXr/e5KKMq7FdThf8SUrN9mEM1kg==
X-Received: by 2002:a19:6e41:: with SMTP id q1mr45228904lfk.20.1560693377880;
        Sun, 16 Jun 2019 06:56:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id z12sm1297835lfg.67.2019.06.16.06.56.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 06:56:17 -0700 (PDT)
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
Date:   Sun, 16 Jun 2019 16:56:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190615045405.GA1023@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.06.2019 7:54, Wolfram Sang пишет:
> 
>>> Without a maintainer ack, this is an exception this time. Should we add
>>> Dmitry as another maintainer or reviewer at least?
>>>
>> I shall followup with Maintainer for ACK in future I2C tegra patches.
> 
> This comment was not directed at you, sorry if that was not clear. It
> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
> interested).
> 

I don't mind at all to review and test patches for the driver and can propose myself
as a reviewer if that helps and if there are no objections from the Tegra maintainers.
My primary interest is to have my devices working after next kernel update, but I also
like to review patches in general if they are touching area that I'm familiar with.
