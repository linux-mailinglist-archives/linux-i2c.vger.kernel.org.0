Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F58D458593
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 18:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238628AbhKURuF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 12:50:05 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:44601 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238480AbhKURuF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 12:50:05 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 678832B00900;
        Sun, 21 Nov 2021 12:46:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 21 Nov 2021 12:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.in; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=NF8A30VDPgxo4gV5iWZLIEuYq0B
        stUMwp7oBomp9GCE=; b=gn3TJpPQJUCsdPBSN6sYQBTxFGHJNyQ2BUAQv1P8wKf
        LBihnD7oUU/d+hCGNLify1s28gYiTFgbRZSVNQ6pYUMNVl3uMuqUx1gwoIyZ8Aoh
        zEinPwO22dIrrL/ssqh2c/49dZTHJGIYQgOfnL/jj8gN7HXMvd9XcCfqMBf5lT2g
        P1TXi6Va37RFgO9/XznLfz3ZtNrZ0K8o5YLDm4m63tO0W8AVCiZ42HWvuGC5TfbA
        iedUN9FYB1Olrd9Vfo0QrwdW8FfeXfHJOkQTgpTmuiWpwSi92Nw9LMT/IxDQBxYV
        j1JDCHPcmBECknxNsVFv2oPcB3IYIlqqqjwDyPj9d1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NF8A30
        VDPgxo4gV5iWZLIEuYq0BstUMwp7oBomp9GCE=; b=PbWT94mpUa7Lur523jDCcD
        C9SjT6Po8wZrq2PoQUhFbN0NJKMqo8VT2TUEqR+Xf9vBbJevJhTNi8ZWfuU+BVp2
        9SFKzkIoEVDb7S4KJj1YRPxC3Mwvfxkf1muCqH8ZmhzoxzZ1KFGxm1s8AxhSF6f/
        rdQfRSq5W8i/jK22OeQfXU/Q4zVXFrhpIQI+cbsqfBP/mrxP6E1egwycx0KVitms
        bnwWF1hC02mFsh8+CmMTWbw/UKh19aMgriDP+2voxWmOHFeDn9NISd8ZVHDmvUwd
        /et5mFcSkTBH7NQrxTr2lxeVkTxzwfXzjoEHxi4VvxDrio2MmP7IqYV0wdyM2sgw
        ==
X-ME-Sender: <xms:EoaaYWxHGOQexl99TZa1ju4W7_ywlG6vNCbnWBRYEu5SSahwgJQ3gg>
    <xme:EoaaYSSNB7a8TgrAY0IriYXsjAclSTh5GASlrWwhS6ozV4HWI1bKtUl2pt43l8qrO
    L3lhPyqG9XIgu9kSAk>
X-ME-Received: <xmr:EoaaYYXIlZatBSNB23wx2XXmcNwowxhAQbhF6wnCSRZqR02VXLctki9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgedvgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeffvggvphcu
    ofgrjhhumhguvghruceouggvvghpsehfrghsthhmrghilhdrihhnqeenucggtffrrghtth
    gvrhhnpeejieeijeekudeffeeivdeujeetffeuhfefudejudeiteevhfelueekvedugeeu
    feenucffohhmrghinhepnhigphdrtghomhdpphholhholhhurdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvvghpsehfrghsthhm
    rghilhdrihhn
X-ME-Proxy: <xmx:EoaaYchKbSXnqu_kzuuVV12uHdqPKWZ8gxr76_wy0o-CAtU-ZlW8vQ>
    <xmx:EoaaYYBLXL25f3Rrn5vAvDF18Niq_Qpxgv3hMNCs9tF7x30Gqpdvyg>
    <xmx:EoaaYdLBB6e8dLVC8EYDonolxejL-vdm2A5Qd55ZdKnDn-i6czT4vQ>
    <xmx:EoaaYbPPY7DbWNV0R_T5AMA7rZMPWe52ST9op4Fi_A5IL3bKX9vItyOXTjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Nov 2021 12:46:57 -0500 (EST)
Date:   Sun, 21 Nov 2021 23:16:54 +0530
From:   Deep Majumder <deep@fastmail.in>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Docs: Fixes link to I2C specification
Message-ID: <20211121174654.hu26uxcd3lsdpypq@CodeMachine>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211119061401.19852-1-deep@fastmail.in>
 <4c16a9f5-3728-5377-1286-001b1b362bb1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c16a9f5-3728-5377-1286-001b1b362bb1@infradead.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Randy Dunlap wrote:
> On 11/18/21 10:14 PM, Deep Majumder wrote:
> > The link to the I2C specification is broken and is replaced in this
> > patch by one that points to Rev 6 (2014) of the specification.
> > Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
> > specification, it is behind a login-wall and thus cannot be used.
> 
> I don't quite get the "cannot be used" part.
> I created a free login and downloaded this spec,
> so yes, it's a hassle, but why can it not be used?

Perhaps a more appropriate wording would be "cannot be used as the only
source of the spec"? Because as I understand, many users may be
unwilling to sign up to a website just to download a spec sheet (if for
no other reason, for the fear of spam).

> > Thus, an additional link has been added (which doesn't require a login)
> > and the NXP official docs link has been updated. The additional link is
> > not the Wayback Machine link since it seems that the PDF has not been
> > archived.
> > 
> > Signed-off-by: Deep Majumder <deep@fastmail.in>
> > ---
> >   Documentation/i2c/summary.rst | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> > index 136c4e333be7..3395e2e46d9c 100644
> > --- a/Documentation/i2c/summary.rst
> > +++ b/Documentation/i2c/summary.rst
> > @@ -11,9 +11,11 @@ systems.  Some systems use variants that don't meet branding requirements,
> >   and so are not advertised as being I2C but come under different names,
> >   e.g. TWI (Two Wire Interface), IIC.
> > -The official I2C specification is the `"I2C-bus specification and user
> > -manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
> > -published by NXP Semiconductors.
> > +The official I2C specification (revision 7) is the `"I2C-bus specification and user
> > +manual" (UM10204) <https://www.nxp.com/webapp/Download?colCode=UM10204&location=null>`_
> > +published by NXP Semiconductors. However, you need to log-in to the site to
> > +access the PDF. An older version of the specification (revision 6) is available
> > +`here <https://www.pololu.com/file/0J435/UM10204.pdf>`_.
> >   SMBus (System Management Bus) is based on the I2C protocol, and is mostly
> >   a subset of I2C protocols and signaling.  Many I2C devices will work on an
> > 
> 
> 
> -- 
> ~Randy
