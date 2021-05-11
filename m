Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC3F37A96D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhEKOfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 10:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbhEKOfi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 10:35:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474EAC061574;
        Tue, 11 May 2021 07:34:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t18so20396837wry.1;
        Tue, 11 May 2021 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PXtPDTLm5lAmEEo1F+1j1JYK4vr+oWqHQk1zSFGYnJA=;
        b=WY8zyzJ1q8iOm/RM61mp2jF2p5Yx7Bw3lAXG1NG3rDhbQmWJN4MvH8A4atjO7UcFCv
         7sqxw8mAXqmn2ZV2FdysgrVSk7HMESwU/mZhii/nsCR+5pVEyG0+mWKMTD+Kcv/3LD0m
         h0ywVSHh/f+PZvqzkxfNI2geuZaJ9z0RCChLjLmgwP8QP+PWyvkV8QJaKnq8+Jb9TZ1w
         5APgHcN+Ipm1XPU/Rlaw4nOzSw9ja2tXbkMP99OdjREpnbBX/R9zHSPBGVxuxAKEwmRM
         8EgOELnUDz9Bpz2yoduwzwDfOe7PnxqRY3DliSeUaXLakBaa8l/8OIttxmyTjjrdb6ZE
         1cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PXtPDTLm5lAmEEo1F+1j1JYK4vr+oWqHQk1zSFGYnJA=;
        b=eu30IOFIfhQY7fGKuRxcfhYzzFNwumNIQvEFO0wvao1v71YDp2+dn8bsAmptG5n/lN
         OxTq4Se2cFDegbzqS/43zZ50JeClXVE27iAxme8eukfjnW2mKdDCAIHQUYHn7HaWvlXt
         VvpYkEhZ7bbFDmokAIecFRwfbpFXNWcSnfuAp0aUyihlb27AG+WLEaVmgVFhdM1Bs1yO
         6jQ2enpCBluRIlkhjVC6qCcFyaJDG2sKdzp+jkzCaMw+dpk73UsdWLhFtFa2LCTcbUAa
         uc8I033+C87jwYnJdBITWUF9DE2bWzju3dK/jX4WywSppWm+yjrZeIYPEeMpKWiWay3d
         QVZw==
X-Gm-Message-State: AOAM533DFSaszxoEwTQ0Jqeq9A6X3WgPeM2Wpi1nsVlDg92mS28Fkh7N
        BLo1kdhS/YQ9dQOdV/EHBKE=
X-Google-Smtp-Source: ABdhPJz0TY1qphO7VFZfcOkgffX1zZgifdrOE4yivByGJYeoXhBCM1C9KE8SCznYzcqsuLsSAL0wsA==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr38112104wru.36.1620743670984;
        Tue, 11 May 2021 07:34:30 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id z8sm27458765wrw.74.2021.05.11.07.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:34:30 -0700 (PDT)
Date:   Tue, 11 May 2021 17:34:27 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Tom Rix <trix@redhat.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.zaidman@gmail.com
Subject: Re: [PATCH v4] HID: ft260: improve error handling of
 ft260_hid_feature_report_get()
Message-ID: <20210511143427.GA1572@michael-VirtualBox>
References: <20210511101208.16401-1-michael.zaidman@gmail.com>
 <30c2857d-5094-402e-25a8-48f5be83fa3f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c2857d-5094-402e-25a8-48f5be83fa3f@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 11, 2021 at 06:10:36AM -0700, Tom Rix wrote:
> Generally change is fine.
> 
> a nit below.
> 
> On 5/11/21 3:12 AM, Michael Zaidman wrote:
> > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> > 
> > The ft260_hid_feature_report_get() checks if the return size matches
> > the requested size. But the function can also fail with at least -ENOMEM.
> > Add the < 0 checks.
> > 
> > In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
> > buffer if there is an error.
> > 
> > ---
> > v4   Fixed commit message
> > ---
> > v3   Simplify and optimize the changes
> > ---
> > v2:  add unlikely()'s for error conditions
> > ---
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > ---
> >   drivers/hid/hid-ft260.c | 24 ++++++++++++------------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > index 047aa85a7c83..7f4cb823129e 100644
> > --- a/drivers/hid/hid-ft260.c
> > +++ b/drivers/hid/hid-ft260.c
> > @@ -249,7 +249,10 @@ static int ft260_hid_feature_report_get(struct hid_device *hdev,
> >   	ret = hid_hw_raw_request(hdev, report_id, buf, len, HID_FEATURE_REPORT,
> >   				 HID_REQ_GET_REPORT);
> > -	memcpy(data, buf, len);
> > +	if (likely(ret == len))
> > +		memcpy(data, buf, len);
> > +	else if (ret >= 0)
> > +		ret = -EIO;
> >   	kfree(buf);
> >   	return ret;
> >   }
> > @@ -298,7 +301,7 @@ static int ft260_xfer_status(struct ft260_device *dev)
> >   	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
> >   					   (u8 *)&report, sizeof(report));
> > -	if (ret < 0) {
> > +	if (unlikely(ret < 0)) {
> >   		hid_err(hdev, "failed to retrieve status: %d\n", ret);
> >   		return ret;
> >   	}
> > @@ -720,10 +723,9 @@ static int ft260_get_system_config(struct hid_device *hdev,
> >   	ret = ft260_hid_feature_report_get(hdev, FT260_SYSTEM_SETTINGS,
> >   					   (u8 *)cfg, len);
> > -	if (ret != len) {
> > +	if (ret < 0) {
> 
> nit: should be consistent and use unlikely(ret < 0) for this and other
> similar checks.
> 
> Tom

I preserved the likely/unlikely hints in the critical path where the
performance matters. And for the sake of consistency, I removed them from
the rest of the places that are called rarely and are not performance-critical
to be aligned to the other "if" statements in the code.

Michael

