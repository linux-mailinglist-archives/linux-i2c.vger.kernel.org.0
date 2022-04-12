Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEE74FDDD2
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 13:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239746AbiDLLku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 07:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356155AbiDLLjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 07:39:49 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EAB5AA5F;
        Tue, 12 Apr 2022 03:20:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0FFED3201F82;
        Tue, 12 Apr 2022 06:20:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Apr 2022 06:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=undef.tools; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1649758833; x=
        1649845233; bh=aRTApUSPxPOLZop5S/TZELqtxAg3W/UHUjXVwD/lHLM=; b=R
        R5rYINfZ0nps4BJkw16j8qEW+Mrpac5C0AcE8g6ztszRuzlpkf6xRrKhuNXdCr9l
        dX+cGVE4H+Dz6kWo68cr8+qWx01qjMI0j/VldYYQTKaN6WnHNLqel7VFf27FPVyX
        AGJY2ipZYg7OJF5UkLWjqUBlDRDq6oo7MfOx0SUzIrPKhGaUAE3Wfo4GaWIF/SWZ
        sTHhBFR5c4zhyaoXwAXvZpp6Odkj6zw7YDeBWGRxLER8xmATblZdsJsbYfhkRKSF
        Ou5J8sVVd8Al9xAC2CFJt9aJeyGV0L/HyKmHDqE/9+pS0OSRQq+cA+1WJQpJ1Q19
        9PPbsjbuKKt+F1j2Oi/WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1649758833; x=1649845233; bh=aRTApUSPxPOLZ
        op5S/TZELqtxAg3W/UHUjXVwD/lHLM=; b=afgmwmEBa0E/skokOknejBLFq8PoO
        u7YabiKT6Ox7ixA/5ot9FX7wsZ1+oS4wYTSiGGg5TitU0SR9ZFg6ZVdL0Ipq5nV1
        DknfCz/WUcpytUgh4SFb8kBjDGeqr+F0LFLsYhEiTEJRx7pw7LrnqSGxB/s3na5w
        o3pn9ufAC/s83FdMlkWgxGYnIUVTu5QR+QNnPCCcbJlraV7vFOJDQi4IbO21yZUS
        itd5F3kYF3PFYf09pvOMCePoQ/ZVZ7QDg/KyZSjuE7B+GV1U1OMzz7wGU3tB6lod
        jcATYcA7NSo5pKYhI4FeFpI8KkKB7/zUproAdjq7nBGaqDKkv89wGrgEw==
X-ME-Sender: <xms:cVJVYupzJMMiA3faFLhYlnJR_t1leCJIq_AOZpRG7N0E3xBw2qyC9g>
    <xme:cVJVYsqyV-Z4dA6qdPtkg7zlVOUW534n8ihL71q_CAOqDpHwAW1m_xZnI4ORO8iJf
    _ElQEhhlTBnbjqSgrs>
X-ME-Received: <xmr:cVJVYjP0kNNdpGuwVUwEkHpIMjkD8WoIeaJe8eOXT67ZXQ8mkRUmSUYmrpqHaioQrHynFH0AZMpDDFKNlc0XqXSzvSRuhxvnRmGGxohUzVe_YhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthejredttdefjeenucfhrhhomheplfgrrhhr
    rghhuceokhgvrhhnvghlsehunhguvghfrdhtohholhhsqeenucggtffrrghtthgvrhhnpe
    dvveekhffgtdduveekgeefiefguedujefhudfhvdfhffehffdtgfdutdetjeevffenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkvghrnhgvlh
    esuhhnuggvfhdrthhoohhlsh
X-ME-Proxy: <xmx:cVJVYt43Be7rH6aUbV0JQnV13IKMRy9jplvPs5cL_44JmhxaxowhvQ>
    <xmx:cVJVYt4BVklTM8Gig5ZTrb2FeuOsfIcHimoCzGqgDDCrhMpw-vZ-7A>
    <xmx:cVJVYtjb2jxOFwIdJTNYomAEXFtTTAzVhGNS3xxQ8AEI6mxrh_53lQ>
    <xmx:cVJVYoaDm-GIuSMK_oZUVAH0UPKM2HD4ZsNt23WzO-NKvcB0rlpyQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 06:20:29 -0400 (EDT)
Message-ID: <bde4ae40-98b6-7a77-2059-33c34442b604@undef.tools>
Date:   Tue, 12 Apr 2022 20:20:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/5] Input: pinephone-keyboard - Build in the default
 keymap
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-4-samuel@sholland.org>
From:   Jarrah <kernel@undef.tools>
In-Reply-To: <20220129230043.12422-4-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/30/22 10:00, Samuel Holland wrote:
> +
> +static const uint32_t ppkb_default_fn_keymap[] = {
> +	KEY(0,  0, KEY_FN_ESC),
> +	KEY(0,  1, KEY_F1),
> +	KEY(0,  2, KEY_F2),
> +	KEY(0,  3, KEY_F3),
> +	KEY(0,  4, KEY_F4),
> +	KEY(0,  5, KEY_F5),
> +	KEY(0,  6, KEY_F6),
> +	KEY(0,  7, KEY_F7),
> +	KEY(0,  8, KEY_F8),
> +	KEY(0,  9, KEY_F9),
> +	KEY(0, 10, KEY_F10),
> +	KEY(0, 11, KEY_DELETE),
> +
> +	KEY(2,  0, KEY_SYSRQ),
> +	KEY(2, 10, KEY_INSERT),
> +


The driver currently being patched into most distros supporting the 
keyboard exposes the symbols printed on the keyboard rather than the F* 
keys on the function layer. While I agree than exposing function keys on 
the Fn layer is more logical, in practice running this patch for a day 
I've found it's far more useful to have quick access to the standard set 
of symbols (such as | and -) than to have the function keys.

Would it be possible to either set the default back to symbols or expose 
another layer (potentially under the "pine" key)? An alternative 
solution proposed on the Mobian issue for this was to add a module 
option, allowing these to be switched at runtime rather than compile time.

