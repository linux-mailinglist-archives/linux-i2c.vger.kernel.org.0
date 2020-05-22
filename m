Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBF91DF16B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 23:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731041AbgEVVq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 17:46:28 -0400
Received: from mout.gmx.net ([212.227.15.15]:45573 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731036AbgEVVq2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 17:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590183983;
        bh=0cAvgvTzadxNHdo+0ax5F3HOYfmkZV6eBKXEHJdz5to=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Dn7/hw11+duCRug99FO2L6eEWjPMLUYMIUfENznRtaVlIU8tplGWywpaFTsmLJ9Lz
         5zr3VxDIncdwL0xXYXJLGmZYd3j1Xo9ByFCn8pvL0PES+ERyRW2PmMiKjUVOH0Zqtw
         QTJtoX4VNjf+Ai5yXRYL9LkflsmbFr1shKmaQ5LE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.16.252.102] ([78.48.61.116]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1jIeJC2i6r-00K7x2; Fri, 22
 May 2020 23:46:23 +0200
Subject: Re: [PATCH v7 3/3] arm64: dts: msm8916: Add CCI node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        vkoul@kernel.org, wsa@the-dreams.de
References: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
 <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net> <20200522165758.GH11847@yoga>
From:   Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Message-ID: <763d1526-7949-1f7f-db0c-1558b91a8f24@gmx.net>
Date:   Fri, 22 May 2020 23:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522165758.GH11847@yoga>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:cOBLooysdq4tC/MePe1bx7EnIFJbepvYMneiS4UAb0IqbCARZO0
 yDJbU9HvRcMyvl9yPagYqjb/sJsJpWP4j/Sp6tz6/HQlxzbtO0Oh14SVllKYxk/K82+nQx7
 jCXNkuV2l+yqQd6+rkSeqOxu4OsNey9paaRC7iiYwjh2v9KEmcah5dluUNBAGP2bJzAliBU
 MsvSTyZzhM9QqiCcKz2/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DSdKpXIu7t0=:gbPME5TsY058lgEVAKGw6i
 EfRl1RYAl56hpDey/WjAWtbQAhTusctTjSPIl7M0+mS0fmJdqX1LRQVQ8VkN60SOdRRGOfvWL
 uh2EXutu7rsiTRSh7M9W4FgXO8FrkHuN3ZvjX6EZucBI53cuQJjYWny7JQAf1homCQtdO3BVu
 dPwrXZsZ5zI56IQ2m12fnq3JGGsNxNcNoD8PJl3veF6XBPwKXI7Jn3UZycpf0wtlzLDBIspZ2
 u/BWuaTs9OHfQe9BIgZG6ldabGRkJuJSFplhLv4auC1C6YSpefn37eHSqE8vJq12TfjHrsf2g
 GlicdJ7erO4WRr0USk4Y3I+BCVmbNJ0NgBO6b6uWjs/aTzV/aAa5VL0LzDzp+5A8YK3BGsmX3
 ZTq6cgqGMLLUtRkGYhkmaWM9VvduC/VN5lpQ9zH0Vh52R+vM25UaCB8z1wSUzD3cM1d3eqjaF
 wiIQRJqXaJpZUjixhxrStRsf0o6JCJBbJ+YR6NT5RXPOv6F8X6VVk3Ek96u8tUE3hU0XDw0UD
 89zleqRlfeywlV79CVJIEwJ64CotCgxZd0eeWbZmVYocDD7mw/rGxdIzQa19HXLFwpdgkaBEb
 6a293wwehCCOkccpVlVK721WA/k7P5ZbxOgRZBUXQmsZDm0H6gwaNU1uOzCXNiHxeypEFfWRm
 cUWmDTur0AlBIYMKg43LFm1iSrdWxljS4Gs/wBHTS2viL9PRV+egX5pbeQ5nJJ0U9Azcec/9f
 NS2ELvHvsdVdP4DCyMaaKUoeOReyDCbcF+CEJHx8Z6WoUzC2ZYuB2WbRFr5YXCbCZ+MCEDaAS
 S5Rrb5muIM75QkL4vPNSTnZcC5g6H2+W1tng8LVSALG7vhefb1YiBJTX75NGrD46tmSkfhITO
 P/zXMnB+NeC9r1xbHPG/60Ba0CmF3UQqn4HDqqS1lenuPghsnYigbkbfNEhVmI3kS4836z7yq
 HtBp1tJveXBkxRbUffQ7kAZOZhXpPeWRxSgtzbpeAO/9OCsaB+t+Np9/3TKxHYmSTpVM4uTSG
 97QpFCTh/+EfW39xwyKZpCu5r96bfGSU/VHUnSTWIlt/6m9GMNkY8GJwb7s1qOudr18y+3Uu8
 uMLfiz0ap7w0vLlmTizWroP0yFp/6i1cJmmO8tmB09hQywIsef1PpeU8oht+2aB4h66y9TblT
 oTNmByFJz2H1Bz3pYohdmDk6MSmqiACV8MQdxWDZuFplAk1GUSdfRS8x8qsxG2pAEmDnbXI85
 UxzblXo4FI8tYtkF/fI/z7yBYSPYREaxUgrZFAA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22.05.20 18:57, Bjorn Andersson wrote:
> On Fri 22 May 09:10 PDT 2020, Carl-Daniel Hailfinger wrote:
>
>> Hi Loic,
>>
>> it seems that this patch was not picked up in any tree. Do you think
>> sending it to linux-devicetree would help?
>>
> Afaict it's part of [1] and as such is part of the qcom pull request for
> v5.8-rc1.
>
> Please let me know if I'm mistaken and I'll pick it up.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-5.8

Indeed, you're right. My apologies.

Regards,
Carl-Daniel

>
> Regards,
> Bjorn
>
>> Regards,
>> Carl-Daniel
>>
>>> The msm8916 CCI controller provides one CCI/I2C bus.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@xxxxxxxxxx>
>>> Reviewed-by: Robert Foss <robert.foss@xxxxxxxxxx>
>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@xxxxxxxxxx>
>>> ---
>>>  v2: add this patch in the series
>>>  v3: add only cci node for now
>>>  v4: no change
>>>  v5: add cci label
>>>  v6: no change
>>>  v7: no change
>>>
>>>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)

