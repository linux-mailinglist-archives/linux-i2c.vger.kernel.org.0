Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA7C35F525
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 15:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhDNNmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 09:42:36 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48253 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230477AbhDNNmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 09:42:36 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id EE1F51687;
        Wed, 14 Apr 2021 09:42:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 14 Apr 2021 09:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=S
        q+aFQYu85UJZAAI/3lU2S/K+bPFlpctOhTGjYKZApA=; b=MkTHDEEZhPOaH0Zip
        7RN9Z/f+atP0Hk5MLf9vDu+r7HRFVj20uoaEQP61DWrLDGq0xImTsCjoaSsvaHHB
        09DyTwH9bqcWgc5jCZS+WAqFowNK58ASS7DmhuqjyzX70z4A3a7RKH6uydhhUVJr
        FUt5KpEnhZhC/4vWWJFShiE/PwJNn5QSnwOMDE/X9+sK07mNPE+BqXGrUR9RLwqd
        arhF8uKu0GpdP3mMQICt/CvdH6HTXoVDtoKEDiabrUvvlNO3JvuW/g5N2YfxqSyy
        xdKPxW5DF0fcpUxA3OPSUtjkZc31EfLpMVAyfkbhdkA2pmzxh7qlRfpgQEoXM7bV
        lr0aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Sq+aFQYu85UJZAAI/3lU2S/K+bPFlpctOhTGjYKZA
        pA=; b=Scn0DUKOtZP2XyCw3Pc4E9J/EUlS5Kfn2XB3CZdDeO0GHJFQ2A1uVDwJM
        8oxKZ/ml/CDfb3ioGdw/iF/lVGFek6eZFdSlCTEw1ZZqCfFVy8+aUo1nDMmKwssH
        fbhAMUl+4csJ7hNR7oSdRrq8UAlXEKJUe3vsbQ6s5iJwjQKxJzD3SEvRlZqtpBWI
        d8xQdtTvTe+8ycosjXvzDRwAZm7PQsuQE7kOLRMpkRNF7L6xwWzWWZPFCFnwXLrk
        9TEG/W2LUFSFXuzmUnBJTvMnQmBOm5oh/5ZPNcwwnD6GDJ/hjoShktOiQVJ+/4FN
        4Igdxi7kqasDYZi1xr5bLp7dMcHew==
X-ME-Sender: <xms:NPF2YItFIMfxVADNSiKx40QyWmgVZmsL7qlhdBGBgt7OYUpQ76IN_w>
    <xme:NPF2YFeaUrVUPmGpkdUt_o9u_O81emhKth5ThTetphrY5KQuksI99kB1L__Y_kgyk
    -UfVrH_wawG8sFE2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
    udetteelieejnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:NPF2YDw5ahyF7kVzFClFOn1aQ4E4lWtYwpGpCE724UN61Jcjwvq3XA>
    <xmx:NPF2YLOy2ZiSFY_uis0gkeciwP2irLWLIwtqjVvDOY7TK0O24rT2vQ>
    <xmx:NPF2YI-shd7xBWlSNcdYhKxV2HvohIVsvlTg2rctOa6SKmkZItx-Bw>
    <xmx:NfF2YKIc3jMLVoXenfjvQTKFVwYW8KEHNJWXzws1UZexLnN_8qbKUQ>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8BA26240057;
        Wed, 14 Apr 2021 09:42:12 -0400 (EDT)
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime PM
To:     Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, Ondrej Jirman <megous@megous.com>
References: <20210408020000.21914-1-kabel@kernel.org>
 <20210413195854.GB2751@kunai>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <01f2a007-39d8-d7c0-b3bc-ef379956d43e@sholland.org>
Date:   Wed, 14 Apr 2021 08:42:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210413195854.GB2751@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/13/21 2:58 PM, Wolfram Sang wrote:
> On Thu, Apr 08, 2021 at 04:00:00AM +0200, Marek Behún wrote:
>> I noticed a weird bug with this driver on Marvell CN9130 Customer
>> Reference Board.
>>
>> Sometime after boot, the system locks with the following message:
>>  [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
>>
>> The system does not respond afterwards, only warns about RCU stalls.
>>
>> This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runtime
>> PM support").
>>
>> With further experimentation I discovered that adding a delay into
>> mv64xxx_i2c_hw_init() fixes this issue. This function is called before
>> every xfer, due to how runtime PM works in this driver. It seems that in
>> order to work correctly, a delay is needed after the bus is reset in
>> this function.
>>
>> Since there already is a known erratum with this controller needing a
>> delay, I assume that this is just another place this needs to be
>> applied. Therefore I apply the delay only if errata_delay is true.
>>
>> Signed-off-by: Marek Behún <kabel@kernel.org>
> 
> Gregory? Looks reasonable to me and if so, we should have this in 5.12
> already. Comments from others are welcome, too, of course.

I also don't have an affected platform, so I did not notice this when adding
runtime PM. The change makes sense to me as well.

Reviewed-by: Samuel Holland <samuel@sholland.org>

Cheers,
Samuel

>> ---
>>  drivers/i2c/busses/i2c-mv64xxx.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
>> index c590d36b5fd1..5c8e94b6cdb5 100644
>> --- a/drivers/i2c/busses/i2c-mv64xxx.c
>> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
>> @@ -221,6 +221,10 @@ mv64xxx_i2c_hw_init(struct mv64xxx_i2c_data *drv_data)
>>  	writel(0, drv_data->reg_base + drv_data->reg_offsets.ext_addr);
>>  	writel(MV64XXX_I2C_REG_CONTROL_TWSIEN | MV64XXX_I2C_REG_CONTROL_STOP,
>>  		drv_data->reg_base + drv_data->reg_offsets.control);
>> +
>> +	if (drv_data->errata_delay)
>> +		udelay(5);
>> +
>>  	drv_data->state = MV64XXX_I2C_STATE_IDLE;
>>  }
>>  
>> -- 
>> 2.26.2
>>

