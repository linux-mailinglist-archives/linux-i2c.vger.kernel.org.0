Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4923C620BF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfGHOpG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 10:45:06 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56281 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGHOpG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jul 2019 10:45:06 -0400
Received: from [192.168.1.110] ([95.117.164.184]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0X4c-1igq9K0K28-00wTJK; Mon, 08 Jul 2019 16:44:06 +0200
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <b6abf5a2-3151-29e5-8eb7-c960580fd4ea@metux.net>
Date:   Mon, 8 Jul 2019 16:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2jvRaVlfIBbTWqmqs0v71/intYTyRlJx4arYouNLUMLImoa4JE8
 Due+PYAz9HHlV+Oh+JGvJQEVWaMqdW8Uon8bE6aHmyP8jq9DMorJEvkmsLYY+Y0Qhs4zwbv
 y7HQMEjNaeKMhE2X4e5YLDubhQW/BSnmjtMmJ0aTTdDAmP18wIi5s3lNhDqQs+e+WaQDOxX
 AADgUj4XIC3nDfJfDfgyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BNa//kL+MSA=:/U9k6JExtxUNSL7QQzrsVO
 Qc/YmJFqFi09e6T66lH+eMgVWarfdks/PkAbhyQSktly45MzYnQ/s0DecPsTJhutefvm2VPNm
 BCMRR7bsmjcQQjkDgIdf4xHk+1c6xMilKnXtdnfDMXpLyBXSFAbS+CeBEWLqwqg6IMvfOiEPG
 TeXkmT31LlnLRirAyV21Ukz1h2ZNsLo/NAG7Ca6VcoSYx4Fjd1IfLON0F5/5SGTKjNV+HlgIU
 4MZSLWYhGjywPlPOdguG924KONrEzbE6D00X7MKuS0vvvmbsp2SN/+1ddSuFqOSO5YPToO7OO
 z2WVRY1fPvJC9eyLIsKuLhWcNOxVnvMClIMPmNS58Nh/1nxhf0RJFOk1DL8e6T6CP4tcHvxx9
 wSMXRQ/sohx+GsBr1KQRnKxEGky965NbmzBsFydKdioBZBH0wWf8cFDyvhjD/pTZmqEDrAwpb
 j9XByJy8tLYTTeqk/Sv9OGOZ6KYW0dztaQ/JW52ntYX+VDhgkOVRha04v/DB9YXks9FbCUiWA
 KNNcl3u9Fe8ag8l/GItK1aMpzTndlSInXTFhy4BsIkNmmL1gukAmSKU85++AM8Fodg4DDTpJh
 DQVkgDKbnZUxRcYqx1NGSuT6tPyVLnSy6Hjc47WTUUqCD3IPgJyj+3SIIe3BmcO4CfbspoeRA
 9r4I7e9GvgSlCYfeS2jkSrc8ulDdK5oSWZxOso/tj52W1AzLqwfqf2+R51B1HtkS+WT55N6Hp
 YnzujFdSNwMrvyhmlmWS9KPxKeBdKdw4o4yq+nokVHMPRqwhRrvgB9Crp5Kmz0fMfGIGHRXv1
 jXVRq9ud3voStvHFMZCXWHqw49Vmwhds5x4uGs5GrIDnc5MS0B1CEjGDMSzp5Y59Mz0qyif
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.07.19 13:08, Marc Gonzalez wrote:

> The tuner (si2157) is not on the i2c5 bus, instead it is on a private
> i2c bus *behind* si2168, which routes requests to the proper client.

Should the si2168 make up it's own i2c controller ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
