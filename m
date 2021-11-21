Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B747F4586B0
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 22:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhKUWCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 17:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbhKUWCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 17:02:04 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A42C061574;
        Sun, 21 Nov 2021 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=Fwt37T4d7LTM0vzmiuMiu+xbLg++qPwMMPqVu0kGMTw=; b=EjeXs8orjn6YTp6k/sBm2gzwdW
        IrVNECVdM6RHOKQnqPBDRLmdS1OHs9Uzl096vEJ0+VrxlOy7Jry4YAG/FJJ6MgoNCVaelVQBXvqVb
        hKRviwE45byLf/FGTIPZXjqMOEQ8ObmMvmmkp/Z0XFiSs0UdjyvmG0KkzmA4LfryP8fN9FnuVzzXR
        wojRLjQLzAIAP4JA7+w5vVhZD1Bo78mr6QSbPVzgKd4Xuh3eKupXuPtemFN2cU5n70X9ZXph5X4Sm
        cqt3dimE3YwM/zGOgfmCl48mnY/xU1CP5oPZeJpM4JWMA9eh4ZBMcgK1qlNRZegcGXtnwfsTDlc5S
        MtFUtdUw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mourS-00ENFE-Qi; Sun, 21 Nov 2021 21:58:58 +0000
Subject: Re: [PATCH v2] Docs: Fixes link to I2C specification
To:     wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211119061401.19852-1-deep@fastmail.in>
 <4c16a9f5-3728-5377-1286-001b1b362bb1@infradead.org>
 <20211121174654.hu26uxcd3lsdpypq@CodeMachine>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a8f107ff-cb5f-8bf8-6bcf-9ac8320be0e0@infradead.org>
Date:   Sun, 21 Nov 2021 13:58:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211121174654.hu26uxcd3lsdpypq@CodeMachine>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/21/21 9:46 AM, Deep Majumder wrote:
> Randy Dunlap wrote:
>> On 11/18/21 10:14 PM, Deep Majumder wrote:
>>> The link to the I2C specification is broken and is replaced in this
>>> patch by one that points to Rev 6 (2014) of the specification.
>>> Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
>>> specification, it is behind a login-wall and thus cannot be used.
>>
>> I don't quite get the "cannot be used" part.
>> I created a free login and downloaded this spec,
>> so yes, it's a hassle, but why can it not be used?
> 
> Perhaps a more appropriate wording would be "cannot be used as the only
> source of the spec"? Because as I understand, many users may be
> unwilling to sign up to a website just to download a spec sheet (if for
> no other reason, for the fear of spam).

To be clear, I think that what you have added in the summary.rst
file is fine, but the commit message is too strong IMO.

I would  just say something like
(or you could just add: cannot "easily" be used):

   Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
   specification, it is behind a login-wall and thus cannot easily be used,
   while Rev 6 (2014) is readily available without requiring registration
   and login.

>>> Thus, an additional link has been added (which doesn't require a login)
>>> and the NXP official docs link has been updated. The additional link is
>>> not the Wayback Machine link since it seems that the PDF has not been
>>> archived.
>>>
>>> Signed-off-by: Deep Majumder <deep@fastmail.in>
>>> ---
>>>    Documentation/i2c/summary.rst | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
>>> index 136c4e333be7..3395e2e46d9c 100644
>>> --- a/Documentation/i2c/summary.rst
>>> +++ b/Documentation/i2c/summary.rst
>>> @@ -11,9 +11,11 @@ systems.  Some systems use variants that don't meet branding requirements,
>>>    and so are not advertised as being I2C but come under different names,
>>>    e.g. TWI (Two Wire Interface), IIC.
>>> -The official I2C specification is the `"I2C-bus specification and user
>>> -manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
>>> -published by NXP Semiconductors.
>>> +The official I2C specification (revision 7) is the `"I2C-bus specification and user
>>> +manual" (UM10204) <https://www.nxp.com/webapp/Download?colCode=UM10204&location=null>`_
>>> +published by NXP Semiconductors. However, you need to log-in to the site to
>>> +access the PDF. An older version of the specification (revision 6) is available
>>> +`here <https://www.pololu.com/file/0J435/UM10204.pdf>`_.
>>>    SMBus (System Management Bus) is based on the I2C protocol, and is mostly
>>>    a subset of I2C protocols and signaling.  Many I2C devices will work on an

thanks.
-- 
~Randy
