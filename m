Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC16232955
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 03:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgG3BKo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 21:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3BKn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 21:10:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE97C061794;
        Wed, 29 Jul 2020 18:10:43 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g6so14451168ljn.11;
        Wed, 29 Jul 2020 18:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZWKEJngoLfhhkppq8eEFicxqCaNFQuLwFe+Ry9i9VR0=;
        b=OKIIlyfeMjBGfuQvoh4OzO1JzWurq/DAAfEv4IVHsIhaU9EIs0ZZUkMVF3Rbl1g7dK
         8oLnI8mlAA0yDuJ/VsM3Rd0mvMWAMLtDYcp3BBCOwMogJVtBfqkMHFXLyEDSIIX4Y7zV
         cwXB8ukqffd2T0J8PEXK8g9SLrb1MiHlunl/BQ7NcYY4MgMGhnLW9aelZbbFN317B9TJ
         8O+6qo1jcwo+wG7GrTLURf6+o1ePqkTwCnwbPmf8vGyTI5QO6qT5EuitOn7p193eWzEd
         NBOjpICE/ies/v0UOwzSEew1FY+E5EKkBVK3geOjt7mioEUsiRzkEK4b2MliMyJI4ULn
         LVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZWKEJngoLfhhkppq8eEFicxqCaNFQuLwFe+Ry9i9VR0=;
        b=bapeXFuJgSdQXR+sFCv48hBiO0NEsToXUI4R4P0vu0exZmUhPa6BbS4BNBrYtF/dTb
         oIS45qozt1IA8asRMFH++YleaqWetdsAfe9/xItt42oTYq96n+M2G+BbaKtjc8qjaa2A
         hs5SqsnmlRcwc/0Uu3QGuY3a7lz0K0rJAoHc0R0j8N3LHFys04VRJAAwyXXVAzQ/j6+u
         ZByLkK78wJwZbE2F9y97coefzXy1ulgF6U5kkVe7HljT77WceDWNHeV2OBCOd6f58nP5
         9UA4sFD1TeBjlSUXCQ66u7gf+RDBZgrwCu6ftfnpun8ltUM/JZ5adLjFs13x7qsUBvYq
         5TEg==
X-Gm-Message-State: AOAM533pgbfbmIxd9AC/riEkZWKjZu+IJPCHmmqnHf6zoE33rq5U9KsA
        puMJtAOFrlbA27t99Y2s4w3XF59z
X-Google-Smtp-Source: ABdhPJwGIPVKqY18W3xbI/qBcECiSl3t/7iGIH/zuAH8Xc2d/HetO2yM1KDxIckcJgpWPRGdLMx92Q==
X-Received: by 2002:a2e:9d81:: with SMTP id c1mr263058ljj.198.1596071441626;
        Wed, 29 Jul 2020 18:10:41 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id e10sm692996ljb.118.2020.07.29.18.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 18:10:40 -0700 (PDT)
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
 <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
 <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
 <f5440f57-3653-7cf0-9efe-e9a0c276f7cf@nvidia.com>
 <6ae07f82-53f7-33fc-5892-340b0d9f12cf@gmail.com>
 <887d51fb-4292-c251-6568-32b884e8db67@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a0d4162-09c3-46c7-7811-f38c98e13179@gmail.com>
Date:   Thu, 30 Jul 2020 04:10:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <887d51fb-4292-c251-6568-32b884e8db67@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.07.2020 04:06, Sowjanya Komatineni пишет:
...
> Will have v6 and add additional patch at the end to do enable/disable
> separately.
> 
> Separating this out with additional patch before adding sensor support
> patch requires all patches to be updated.
> 
> So I am ok either ways. Please let me know if adding additional patch at
> the end to split tegra_channel_set_stream() and tegra_csi_s_stream()
> separately is ok?

Should be okay, thanks!
