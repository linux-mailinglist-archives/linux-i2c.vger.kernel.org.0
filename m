Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86DB7C8475
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 13:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjJMLfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 07:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjJMLfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 07:35:45 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A19A9;
        Fri, 13 Oct 2023 04:35:42 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E1D4C86EE7;
        Fri, 13 Oct 2023 13:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1697196939;
        bh=e7PCqsLBRgTfC6vgLI+ZUT5ScbFRE4C4YJx/NEEUwJg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hFtx2mVj7sfWJakcAdz4QyMgu/SCEWuxi8sZmTZHSxdetJZryYXX6oZ40SZCBRBHw
         yHyeb/4A7eZh++cbfCechoHrnpQyhNjcy/v9O0eRo/EzMMb9rZK6u+/IxQhkMQrMzJ
         n+PCDstun8XzE0ZGdAyO/HZcGqyHUcyImobTG0NtCmTHjDpgfcKxgJccTGCdgRWOho
         XjySJ24xMKxlCAGVVr3S8N1KMuaUit1xijG9eZJDCEW1DULWGBAOXVXjvjoI0Jbidr
         XbqEnM7QguzrpmaLfkLx6oDUMh8/9pn/LOh6OPXQo3PtU+YvP85Hyof3+rqXs3RLQP
         tlld0FmtPCraQ==
Message-ID: <0120031f-5b08-44ee-b6a1-b2ea38f8c001@denx.de>
Date:   Fri, 13 Oct 2023 13:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] eeprom: at24: add ST M24C64-D Additional Write
 lockable page support
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org
References: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
 <20231013063008.2879314-2-alexander.stein@ew.tq-group.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20231013063008.2879314-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/13/23 08:30, Alexander Stein wrote:
> The ST M24C64-D behaves as a regular M24C64, except for the -D variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 32 Bytes long and can contain additional data. Add entry
> for it, so users can describe that page in DT. Note that users still
> have to describe the main M24C64 area separately as that is on separate
> I2C address from this page.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Marek Vasut <marex@denx.de>
