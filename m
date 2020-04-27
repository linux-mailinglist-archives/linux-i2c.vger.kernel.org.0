Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461FF1BAC9D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgD0S3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725995AbgD0S3C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:29:02 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144C7C0610D5;
        Mon, 27 Apr 2020 11:29:01 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t14so21688975wrw.12;
        Mon, 27 Apr 2020 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lHULapMa+BsXwsb7nFo4ngDpGWEQISNj1XIuagyOGJ4=;
        b=S4nPK50ggycLkdpsKEzm16DXDnDpUPNe4JP8XftG9GTRTK+xfH2TGDQFSNwNPozCih
         ROG2tV4mOoET9zFZxgHyO8sZNds7kijCfa1t80FBbbrnzf5+SAqv4Jt8nqIDrnLVYNTY
         Ok/bi2D18ftntyliblJnslVzyRoZiOTSOIEJEtu1swPu89TXasrNA4Bo54kfxwLl4PuT
         8Xjla6GUzeZxhXOChhfv+56LKNUsfAFdDCapz8x6jkmhoM63hZh++Kbr/RHtxDI8f2zb
         AQBq4JWVdYep6lykSzc1EsNTVLj3nGaYPMIuhOcbsGEf0fsNWcpCYCBxgYlpUjBCMBf/
         yXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lHULapMa+BsXwsb7nFo4ngDpGWEQISNj1XIuagyOGJ4=;
        b=Oq7BmNTWMhxEaLuVxsJpmImwrJiZSJ+VDbCz7ESFloJVTQkAm2TXDTGgp24Yal9gbI
         cph3NfwZkOOrzcLlfnc3MrwobAMfe0qiix4cW3l+9CWaBuOM06Tfkj27fYSR9ucCwf1Z
         t9l8kukYhiq9ngqjB4+DQslVbsa3pPHT9KJHyqWQTK4CZ6eq7VSQ9c4R9d53in4vEOeQ
         ee7kK1y1szKRQG/BAaFGnrAEbKwgrRHautBx+dckVtDSwyCWTaMrX+JfozvrvIeEUf0y
         dezAXZd5Y9YfItyWIcQpb70KHxRjlWrgsBzXCzFasgSHkNnOsehEtjJ0TPNnvrHZqg9M
         1HOA==
X-Gm-Message-State: AGi0Pua/A4FQLuT81bO+10kc/H9yJp9a8kHpVIcCo4Fc0eb1idc5R7Ap
        kJgiwDF9ovz+rKrM0SK38Z5mPap6
X-Google-Smtp-Source: APiQypJOG6qtfSJj/AHws9ZDonzOzaRMFl/gRiPA694TiwonOAWWNZ4KP8h65Zy99Qla0QP2vjG+Dw==
X-Received: by 2002:a5d:6582:: with SMTP id q2mr28911267wru.343.1588012139464;
        Mon, 27 Apr 2020 11:28:59 -0700 (PDT)
Received: from [10.69.79.32] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h17sm13719wmm.6.2020.04.27.11.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 11:28:58 -0700 (PDT)
Subject: Re: [PATCH RFT] i2c: brcmstb: properly check NACK condition
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a94e4ec2-1fec-b567-dcde-6a7829f2af5a@gmail.com>
Date:   Mon, 27 Apr 2020 11:28:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/26/2020 1:12 AM, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@the-dreams.de>
> 
> cppcheck rightfully complains about:
> 
> drivers/i2c/busses/i2c-brcmstb.c:319:7: warning: Condition 'CMD_RD' is always true [knownConditionTrueFalse]
> drivers/i2c/busses/i2c-brcmstb.c:319:17: warning: Condition 'CMD_WR' is always false [knownConditionTrueFalse]
>  if ((CMD_RD || CMD_WR) &&
> 
> Compare the values to the 'cmd' variable.
> 
> Fixes: dd1aa2524bc5 ("i2c: brcmstb: Add Broadcom settop SoC i2c controller driver")
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
