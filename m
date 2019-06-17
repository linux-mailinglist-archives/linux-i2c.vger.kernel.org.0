Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD12348AEF
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 19:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfFQR6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 13:58:19 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11787 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQR6T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 13:58:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d07d4ba0000>; Mon, 17 Jun 2019 10:58:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 10:58:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 10:58:18 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 17:58:15 +0000
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai> <20190617070935.GB30126@ulmo>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <4abda3d1-b70b-672d-0fe0-6e0ef748f9aa@nvidia.com>
Date:   Mon, 17 Jun 2019 10:58:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617070935.GB30126@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560794298; bh=0ueJBY+Lv6odOXcv++qxQRsJjIhWcKA5wndZDLgnKGQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=DKuno/6ydOH7Oel00ywdck6oDWWbiMppgU5mfbnBCi2UpQgMyp0sEkZJRXo9G4tya
         p2qppgQL8nRHOjFGHKaT+rHIhZb6d94OUqE2S/lRmZ0VHz50HJqyHKcSOAsgmKhkz9
         +tEA1iDctCwUDteJS7Odxcxw4Fd+3ubJVqyK/jhKhmzGsxIPhph+oIYoWYyyguC4Iv
         0mI2BJBKIZI4FGBzbKaJVCfv43IMmA/stOwV9ZitcBDOcKRy0FLEAoHvw6DEKcu0o7
         9elO43NwIuepL23nFFExsPyjajML5/S5fAic3KWqJNjrHteAgjgHMz5cs6KyXyTVV6
         AmY/+giItMaqg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/17/19 12:09 AM, Thierry Reding wrote:
> On Sat, Jun 15, 2019 at 06:54:05AM +0200, Wolfram Sang wrote:
>>
>>>> Without a maintainer ack, this is an exception this time. Should we add
>>>> Dmitry as another maintainer or reviewer at least?
>>>>
>>> I shall followup with Maintainer for ACK in future I2C tegra patches.
>>
>> This comment was not directed at you, sorry if that was not clear. It
>> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
>> interested).
> 
> I thought I had already acked this. I've certainly been testing this
> since I carry it in a local tree. So for what it's worth:
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Bitan, I don't mind getting the patches to the corporate email address,
> but please make sure to also always include the gmail address when
> sending patches to the public mailing lists. My workflow is somewhat
> quirky that way because I work remotely and for historical reasons.
I shall put both email addresses going forward.

-regards,
  Bitan
