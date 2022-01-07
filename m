Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13884872CA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 06:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiAGFlz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 00:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiAGFly (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 00:41:54 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F49C061245;
        Thu,  6 Jan 2022 21:41:54 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id o6so18011819edc.4;
        Thu, 06 Jan 2022 21:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2ANbtFqGg8wvu20ZoWjIUj0175zsTGDLyAKMlzgkjfw=;
        b=ey4NNdPFSA6sD+hPblZd+kIyzk9uAzGkSRfl5w4/Ibh9kwv67eopxethlouxN59h4L
         ucrgqeP1cJFupfe6dZ61/zY2ldAbatvf+1VWXjQIt0CzrDQacpAtP/d36HuG9g5Odg2k
         V9EKPQoTph7jqgIpPsLVv05ffZ4UFRtl8tlx21+qQ8CzAqSh7MUzXPEasfZV0iWPxREn
         tW819A1PHSfjMtoHtq0nxGn3d2/JzcSfaoyjL0CVOSF8WISz/nyctaV9LtJ9MBJhRBcq
         EfAPp32gd54u4tgbkKE87oYBrNTCMwppmxEpPIvXLSga+j297xdep5nMpq627hXNQ9Qq
         OTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2ANbtFqGg8wvu20ZoWjIUj0175zsTGDLyAKMlzgkjfw=;
        b=YqrY3ekqON7EOiSH8ZM8SoHJEOQNewR2n0JpMcRUVDZIzc7J1FZyQR8iPDuFQKRQtZ
         aYmHYPb/H0lTs5w72EQS43iHXB2OvhuCu28dVYgBULKv0WOtxUJp1+OaWs5+QF8C5+uV
         0/ZRR1JJmgDg/w9In5Xr71oLCs2eEonk+e2Q6Ir8qeEZh/VDH3gtPFtiD7kskHXhXiel
         O28jdvwuH3udqsbVMC8eGFOJpCe08mG5G7FBg96A0KdMu1GKi6iY/YPhorNt6ykeTfMz
         TYvz4Ch7ynNWU5TwleSOxMwFqPMueGoGXK/i0eV06xBXwpY7WmPUxhbVkQGhEs3O5oZV
         nFLQ==
X-Gm-Message-State: AOAM532idqSZOs7xtd+Y/0L47cdR4Agjb4BRRoPKksH9npJe7hBtWCO1
        axcbDFEpGDnPDht/7ika7Lo9cspDttgSvg==
X-Google-Smtp-Source: ABdhPJz+SDOhk6IB3e3UyfEvuMBGMsLe2jNAl2n9kPWmf9CFS/wrrqu2VRtBnuiGfh4poRm40j3hag==
X-Received: by 2002:aa7:d783:: with SMTP id s3mr60707815edq.172.1641534113062;
        Thu, 06 Jan 2022 21:41:53 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk. [46.34.226.0])
        by smtp.gmail.com with ESMTPSA id z10sm1627498edb.45.2022.01.06.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 21:41:52 -0800 (PST)
Message-ID: <5cc9b754-e680-30f5-914d-d3b1c8c01092@gmail.com>
Date:   Fri, 7 Jan 2022 06:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
To:     Andrea Ippolito <andrea.ippo@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
 <CAGhUXvCMyVD3aP7Mi+i2hz0A0FePJvPSceubXm=u+4AR+wgesA@mail.gmail.com>
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
In-Reply-To: <CAGhUXvCMyVD3aP7Mi+i2hz0A0FePJvPSceubXm=u+4AR+wgesA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

> forgive me if it's a dumb question, but would this also apply to Intel
> platforms, or this kind of stuff chip maker specific?

this is specific problem with SMBus without host notify function. I don't know
if new intel hardware has problem with host notify.

