Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91CAE7D6B17
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 14:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbjJYMRt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 08:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343780AbjJYMRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 08:17:46 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFBB18D
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 05:17:39 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231025121735euoutp013997a2d9adc12346e7834b8c4d3283ab~RWOB78rJR1351913519euoutp019
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 12:17:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231025121735euoutp013997a2d9adc12346e7834b8c4d3283ab~RWOB78rJR1351913519euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698236255;
        bh=koPmnIYR71MLFlw+rXLBLGv9mCLgWqZkiQU0rYit4sc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=t4QhUNIUTrf9qz+kqjlsdgGot6auWNAn7Qx1TCd03shSHkv9KgGVTeH71oGZ7q6KC
         QwgniJdWdinUxpe6ty4X5Hi00jwA03RhFimTk3wHsnA6y30LMUjSlWj31k7VSm/1t6
         3O5cbHcZAp1hHvFdnzntawdQZcwvLiayLUv3XPuA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231025121735eucas1p246d9725304ab07e9689ac3ab638e7eed~RWOBpXS8j1127511275eucas1p2L;
        Wed, 25 Oct 2023 12:17:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.C0.11320.F5709356; Wed, 25
        Oct 2023 13:17:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121735eucas1p22b65a2c0bc6d30342c4935e3903823a1~RWOBXsbsS0172101721eucas1p2n;
        Wed, 25 Oct 2023 12:17:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231025121735eusmtrp1ae83709764d1ef5dc79590213cc257b4~RWOBXFbHf2882328823eusmtrp1O;
        Wed, 25 Oct 2023 12:17:35 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-2d-6539075f8d8f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.B7.25043.E5709356; Wed, 25
        Oct 2023 13:17:34 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121734eusmtip28e9ff31896a5b187787f2384d39232d6~RWOA57erR0336403364eusmtip2Y;
        Wed, 25 Oct 2023 12:17:34 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 0/3] Add atomic transfers to s3c24xx i2c driver
Date:   Wed, 25 Oct 2023 14:17:22 +0200
Message-Id: <20231025121725.46028-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOd14dstUg6YXQhYP5m1js7j/tYPR
        Yu/rrewWHX+/MFrMOL+PyWLtkbvsFnf3z2V0YPfYtKqTzePOtT1sHn1bVjF6fN4kF8ASxWWT
        kpqTWZZapG+XwJXx7thmpoKf7BXT705ha2DcwtbFyMkhIWAisWDbIiYQW0hgBaPErs32XYxc
        QPYXRom/N1tYIZzPjBJL/u5lguno/HAQKrGcUWLqktdsCC33FjGCVLEJGEp0ve0C2yEi4CAx
        b+13dpAiZoHLjBLT5mwDGyUs4CSxoH8XWBGLgKrEg/eb2EFsXgFbiWNr9rNDrJOX2H/wLDNE
        XFDi5MwnLCA2M1C8eetsZoiaiRwSHz64QtguEns37IOKC0u8Or4Fao6MxOnJPSwgR0gItDNK
        LPh9nwnCmcAo0fD8FiNElbXEnXO/gC7iANqgKbF+lz6IKSHgKLFzohiEySdx460gxAl8EpO2
        TWeGCPNKdLQJQcxQk5h1fB3c1oMXLkGVeEjsO8cLCelYidOrW1kmMCrMQvLXLCR/zUK4YAEj
        8ypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzA9HL63/EvOxiXv/qod4iRiYPxEKMEB7OS
        CG+kj0WqEG9KYmVValF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dUA1Nx
        V/oc93k7bPtNTy+3Wx/9+/C8RVet6p+7eCpG6wZwRbT53F3tbbexVMhr/xVGdXPvjDeL9p5y
        eP9wue6XeXwP/H9N07mlLqFzTOhL9e8i81bXvcbzxPm8799t/HT+gXj+whWeyf8WLcz0/PKO
        87OL1VITo2qjWM2+81+fB23Kvfd969XHfyqkf+sxHDXwffcnpZEn4+0my/UbE9pP1/v+2HRF
        cP5KpXcbo7acW/LUdfN0l4/RLNdjbXuP6rWWTX7kvOC84PLQyNPxKR8z94qtSJxUGMW8KX7D
        wrX1jx7W7Gn7Hfz+jIxmwNffffP+z/B9ueSF9eU3qduqjcRF6tzXLGMosvrbeeVej+OW5HV9
        SizFGYmGWsxFxYkATrWvWp4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7px7JapBmff2lg8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Gu2ObmQp+
        sldMvzuFrYFxC1sXIyeHhICJROeHg6xdjFwcQgJLGSW+7/8OlZCRODmtgRXCFpb4c62LDaLo
        E6PEpdc/GUESbAKGEl1vu8AaRAScJG4vmgU2iVngOtCkA//AioSBEgv6d4EVsQioSjx4v4kd
        xOYVsJU4tmY/O8QGeYn9B88yQ8QFJU7OfMICYjMDxZu3zmaewMg3C0lqFpLUAkamVYwiqaXF
        uem5xUZ6xYm5xaV56XrJ+bmbGIHBve3Yzy07GFe++qh3iJGJg/EQowQHs5IIb6SPRaoQb0pi
        ZVVqUX58UWlOavEhRlOg+yYyS4km5wPjK68k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1
        OzW1ILUIpo+Jg1OqgSllUnFk1D3f1U3Gu6OlbtZotIi+UdjJdvY2c767nZd2R+G67esjj4fM
        kgn78b54jWWIiqb2nNn53f/tpt065H9NaePn6Eey4VkbtsrEz5NsF358dJHkhMMzKrXnt2fU
        1zk6bm1dP/f9Kr7ubcUrGDr8kzYk81ap1X9gjDzu9sW45V2/UKlFgPzHHvaZpyJSTGx+BUwp
        6LM/13VjyYqQvyZujXbuEz5MvXHqvaGPU4359jLRxdM3X+bguPAv1JPXMKWtdk/m3WDjl5Uz
        EmUsRD5MTv5s0jPjtdPp2hrNmRyaG6KkpzXWim6O82WzrtMXK7y3M0hRcOmOWpcZs7b/aLx0
        eeq0g7x/Tpo8lE3kVmIpzkg01GIuKk4EAIVLuwX3AgAA
X-CMS-MailID: 20231025121735eucas1p22b65a2c0bc6d30342c4935e3903823a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121735eucas1p22b65a2c0bc6d30342c4935e3903823a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121735eucas1p22b65a2c0bc6d30342c4935e3903823a1
References: <CGME20231025121735eucas1p22b65a2c0bc6d30342c4935e3903823a1@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear All,

This patchset adds support for atomic transfers, which has been added to
the i2c core recently by the commit 63b96983a5dd ("i2c: core: introduce
callbacks for atomic transfers") to hide warnings observed during system
reboot and power-off. Almost everything needed for that was already in
the driver as so called polling mode. Unfortunately, that polling mode
has been tested only with single message, write transfers so far and it
turned out that it doesn't work well with read and multi-message
transfers, so first it had to be fixed.

Best regards,
Marek Szyprowski


Changelog:
v2:
- updated and extended commit messages


Patch summary:

Marek Szyprowski (3):
  i2c: s3c24xx: fix read transfers in polling mode
  i2c: s3c24xx: fix transferring more than one message in polling mode
  i2c: s3c24xx: add support for atomic transfers

 drivers/i2c/busses/i2c-s3c2410.c | 55 +++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 19 deletions(-)

-- 
2.34.1

