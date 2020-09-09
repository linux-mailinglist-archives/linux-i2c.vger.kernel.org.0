Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2D262E8D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 14:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgIIMbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 08:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgIIMaS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 08:30:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE4AC0617A0
        for <linux-i2c@vger.kernel.org>; Wed,  9 Sep 2020 05:29:38 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gr14so3306271ejb.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Sep 2020 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=K1C45CaJp5OHynxpxf60UmvC7U8kS5of/KUbQVR1u9s=;
        b=GaJznztoSaMYMFWik8DL5BFQt5rpi0vUD2BDHiBLACaM0iuhLB858dkfvcxMydC6PC
         U+L4czHn8xc6LSyP7XAcdyZPkvFAXkwE1SKIoIwVtIfT/W/0mCXqy5hDaziyueuSG9UL
         K9EaJ8khCA/mTvrX++GZ33Cj6IqDAVoszXhJywlaGlcyiw8FhLo+xth4NL8IygO45LKO
         ZYtWFCLaHIN//HDRbhqno6Yxc9Pj22tZJmADc8GT8r6vDlkBrgms8/h8KzyNjpl86+Yp
         WbwSHMoPq2jgyaRbgC2RPif2UBI+Kl2KNlSfHxlABXVjQpKdKzH+sggEFeMglauSNSsj
         bKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=K1C45CaJp5OHynxpxf60UmvC7U8kS5of/KUbQVR1u9s=;
        b=pgwM5a8PpgfAthN3LZQJYuHKj8cvHJv58hfiu0euuuoEcEGR9zIQi3wvwOs3PqMkCy
         8wfswN9Wmb+GSxPHwTZjFok+TvIJ4eFkFcN6TTx93pIMJ9z0ZGstpSaH9v5ChNFGqcBV
         UE43TnP5EPruDq3yLbEca5tEEPWkNTnsgT720Z2E8IRqm72cpokIwruX0c72rq3uEsLz
         35yGzQOdVXE3PJeaHgOPX0GM7Rsak6mQKoiLxol+/JfkJ/voK8yGz9dJGI7IVTKQEnCQ
         34bokDPqyF4tLW9XWIu5GsionL7axT/qgM226hQEXYbQSN6oYaoECDEE9z+ghcddrlfb
         K4Bg==
X-Gm-Message-State: AOAM533yDyxF0cU3P+hHJt03gy2ApA/70clL+6LVu94gfUO9C5XRLpMl
        +TcnfGETNMf339EPjw3yjHUFzOK2Oh76wXbg7o8=
X-Google-Smtp-Source: ABdhPJxS+x9yVtlQ/IjdKEQjQzwP87leR65azj50FAP3sk6OmDHFO3cIh09zNPmVo2bJQspbL878A5zJor+xDJw1XDo=
X-Received: by 2002:a17:906:7cb:: with SMTP id m11mr3481603ejc.41.1599654577597;
 Wed, 09 Sep 2020 05:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a584:0:0:0:0:0 with HTTP; Wed, 9 Sep 2020 05:29:37 -0700 (PDT)
Reply-To: pattegwum@hotmail.com
From:   patricia ahmed <patriciahbo2@gmail.com>
Date:   Wed, 9 Sep 2020 05:29:37 -0700
Message-ID: <CAN38GEnJVPodocz8e2yj5tW8Z0FPEp_7SjgPjmv7YUUVgEYY-A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SmFrIHNlIGRuZXMgbcOhxaE/IHByb3PDrW0gb2Rwb3bEm3p0ZSBtaSB6cMSbdCBNw6FtIHphYmV6
cGXEjWVuw70gb2JjaG9kbsOtDQpuw6F2cmgsIGt0ZXLDvSBidWRlIHDFmcOtbm9zZW0gcHJvIG7D
oXMgb2JhLiBCdWR1IMSNZWthdCBuYSB2YcWhaSBvZHBvdsSbxI8NCg0KUyBwb3pkcmF2ZW0sIFBh
dHJpY2lhLA0K
