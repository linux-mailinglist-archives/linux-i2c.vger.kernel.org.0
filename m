Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9239C4E000
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 07:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfFUFSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 01:18:45 -0400
Received: from mout.gmx.net ([212.227.15.19]:41843 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbfFUFSp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 01:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561094307;
        bh=j+9ugRgkr5cBSkti6gAGZqjZFQcHl631W1bjAG+QsjE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KoDkFGBqZBhN/4hf75by828j/9iAjlQ22DPpPgya0RNvjfYvCYYTcTswpBnocvVCc
         BfYgOrYnoGFIySHWc3uX4CNXIEIbUjgz08xro1UyySSSIr6a1cfTZO5w5F/d/xCdKB
         OO1Bldx+xg0a9yzlLa/KdE+vs9LEaCbScworq3Y4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.111]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MVe87-1i6QbE2RwN-00Z35x; Fri, 21
 Jun 2019 07:18:27 +0200
Subject: Re: [PATCH] i2c: bcm2835: Ensure clock exists when probing
To:     Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        stefan.wahren@i2se.com, f.fainelli@gmail.com, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
References: <20190621042626.19998-1-nh6z@nh6z.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <4dc45e03-7c83-b0b9-7579-c06d028e0baa@gmx.net>
Date:   Fri, 21 Jun 2019 07:18:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621042626.19998-1-nh6z@nh6z.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:c75dy311Of691SxJooNiGiXzmy6KBQDS/U9SPRQ1bjOaTtL2e2h
 hR7LPVicOqrPl94AMehQfG5qbDNYEROKqOjAHCWxKL9oqQt4T8FW9PpguQmERg7CQ8AEhys
 sGkfs3OWvwfGUXjcSYqPZyAwd9jGf4XA5yuZa2WZ0oXIRfdQ0t1e8pFBpscP50YV3dPnMiX
 tp7vIF9jf2G6SIx2sNnZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zneOUG9QPcY=:mN+OqZKdeMIf6t65c5tD0e
 +9V5dr+5xcQAWNepcqYSfgSTQDjcdVA1r63snhj/ZPfa660xjs7plsnsKBOIrioQwqjtcIljJ
 LCEWONLAM3lyx10IZH6qaNUdrc1PVAd0rDcnxHKkyzJwzRnUfBjAs7xm+3A9c2XURoJsj39hR
 Ar05A0UrR6j/C8j0eOWhaWIUty7yjwnThS3Ej95CCneVJ40SmlsPm/SHs7PBl2qoeKCBoZyEN
 rfuZH64TzP6EjVwEV0VHuxrjF37w5w9HbZFPdJi7QOT8Y1leKubz1E/V5vJJF6RZd035gvnwG
 o9KY7bG5KGJZNwo4OjydKa2xGQu3F5Expcn02WVSmc9SeShRR41Kil7O055f3Cw3To+BhXcPw
 QdrStQWTcN5JINT10Dz9u/lP6TkLDVN95uYml9Vlchi6IXhR/4OHQI52ZeW8TLPf3zOYBP/NG
 f0f7gBwxNt+mE/9Qw5VtMHt6+031aEp1lYfDvi4i6R3p07ddtiuCqlndod8QqC45oR/5pTddk
 OIkksHrYKUIrVa64DYv/TmngzvC871soyIin5hSRnDkHDlQZWrTlidvPryUZQ5pnlb8fd+bYw
 pZzcph6QixWdqokZ4NwV+ARON1EN1VBkx51qAbe/dwBLdWHFcXpa4gax4WOBj2T60s+0IVeUn
 w03sLY9izJPnFIHxNYi9LzZWx9IvDEOTijR9tfTDzte6vhzjV0HIeMsZqA04YeHd/aau7RTU5
 aoWjbcJo3Uuq0cWtO9t6aJOwHhU4qgRxG69kcFsRazdcJ1Ubrpfb57NIVh+a/PL2mhMDzapRR
 SSap0VL85qN1zXqY8gy8m9BXv49mAuKfPaLz7BX5LSx3O4lf5ZYwYzKgX82M10dGXRtxQRSE4
 3oAhX+KsZzQidbXLvnBhQwwGsJKYfNZQcHTAnCQ55hn0hajq6Xx8DzPxK0QVRCgJThjz4gdge
 35n07p0T31OQznKpjPkLBqht3SXh/9RFEn92gJHXSFE/ppYVeM9lq
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Annaliese,

Am 21.06.19 um 06:26 schrieb Annaliese McDermond:
> Probe function fails to recognize that upstram clock actually
s/upstram/upstream/
> doesn't yet exist because clock driver has not been initialized.
> Actually try to go get the clock and test for its existence
> before trying to set up a downstream clock based upon it.
>
> This fixes a bug that causes the i2c driver not to work with
> monolithic kernels.

I suggest to split the change into 2 patches (first reorder probing,
second clock) with a small cover letter. This makes the changes more
obvious and easier to review. Please also add a Fixes tags to see the
related commit.

Btw please use my new maintainer mail address

Thanks Stefan


