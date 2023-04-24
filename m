Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD5B6ECA7F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjDXKnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjDXKm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:42:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56E8E41;
        Mon, 24 Apr 2023 03:42:58 -0700 (PDT)
Received: from [192.168.2.45] (109-252-147-202.dynamic.spd-mgts.ru [109.252.147.202])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B567660324B;
        Mon, 24 Apr 2023 11:42:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682332977;
        bh=Khyec6qP6muqNn1QAA/e5bBemmYVoQbsawSoZFlgRuM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZsHY57Tlnn1IMRT23sZtyA00DxAkkn8L3NkWGgio2dPWtcOTfUWGyxf99K1DvQdii
         efJwDLkWeNHAbfgSvQLOUQLV1UBu2FwpddTSxcDbRRtHWxKbGhG/AsA+hwfpfEBhZy
         TNq421O5sCx1IiBOZeEIeQ6K2V6Mo4f5mh37ffs3zUFlna2vySCIBvbrUeUFiJyk4R
         djs8XkFTs23SZxUlNUV2C9uhPXx0nau2dwmDq8xvyzKhkeP+PvRoBspXtWKtN8SXUY
         G4F7q2qkaDOANYPpG5hg3Ai27ySZlj68M+64sO2Zo4RFvcQrQ/RgkmuqCZihrb3P7W
         uX0LqA22XcBfw==
Message-ID: <7213c148-5cf8-c251-b809-c6ff59292cad@collabora.com>
Date:   Mon, 24 Apr 2023 13:42:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 3/4] mfd: tps6586x: use devm-based power off handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com, peterz@infradead.org,
        jonathanh@nvidia.com, Richard Leitner <richard.leitner@linux.dev>,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
 <20230327-tegra-pmic-reboot-v4-3-b24af219fb47@skidata.com>
 <2df6f002-dcf8-1073-d0b5-a9843103096a@collabora.com>
 <CAJpcXm4RRV15UUzsrw_9s4-ifE0W0uKSsZ2sAJxojsoctaT8Ow@mail.gmail.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJpcXm4RRV15UUzsrw_9s4-ifE0W0uKSsZ2sAJxojsoctaT8Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/14/23 09:15, Benjamin Bara wrote:
> On Thu, 13 Apr 2023, 22:37 Dmitry Osipenko,
> <dmitry.osipenko@collabora.com> wrote:
>> Handlers must return NOTIFY_DONE or notifier_from_errno(). Sorry for
>> missing this previously.
> 
> Thanks!
> 
> AFAIU, notifier_from_errno() sets NOTIFY_STOP_MASK, which stops
> atomic_notifier_call_chain() immediately. So I think NOTIFY_DONE is the
> only valid return value for sys_off handlers, to not skip others. So I
> think letting sys_off_notify() [1] always return NOTIFY_DONE might be a
> good idea.
> 
> If so, we could return a "notify return errno" (or also a "normal
> errno") from the handler, which is checked, but then replaced to
> NOTIFY_DONE, in [1]. This would enable us to have a common place to
> check for failed handlers.
> 
> Handlers then should only return NOTIFY_DONE when they are skipped (e.g.
> when the requested reboot mode is not supported by the handler).
> Otherwise, I think ETIME, ENOSYS or ENOTSUPP might fit when the
> communication was successful, a possible delay awaited, but the return
> was still reached. What do you think?

The behaviour may depend on a particular platform and driver. In general
and in case of this driver, it should be more reliable and cleaner to
abort the reboot on a error that shall never happen.

-- 
Best regards,
Dmitry

