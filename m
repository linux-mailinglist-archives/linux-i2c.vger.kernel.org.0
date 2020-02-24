Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8E816A9F6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgBXPXe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:23:34 -0500
Received: from mail-ed1-f42.google.com ([209.85.208.42]:45028 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgBXPXd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 10:23:33 -0500
Received: by mail-ed1-f42.google.com with SMTP id g19so12274609eds.11
        for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2020 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+70aI04GW+GQR4TnI/3Vgnc7rI66+Ah6HAmXTaTvfPM=;
        b=NMTfNWbZlHPJ/NUhcWmGLFvbmJmzDCQhwdQBpRLPSEHvPxDHPx1sErEpfFpMrocpgV
         ULkyrUV6mMBi5/nonsKKJzfWMgMige4HB8VsiMNMs59Ua362K6waZsCjNm83eJQzkSD/
         Wo8QfioUAjqPxXqWGHESg4XXy1dWRSwnjyxJQcbfBaSNfqoLBimcwYcEFnsttLlWKb3z
         R2vn2C3YC+hemiBv9xz+Pc5nIQGso4z2wBzjqKp/fTNjfIVCTYuv8V5Umse0SdlED+1r
         hNTttzEFK35hh7qP2LdN4j9BJM9bqn6t7GyilLnhihPI0kAoO9PUsA/OqdQsROnzLh6I
         46zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=+70aI04GW+GQR4TnI/3Vgnc7rI66+Ah6HAmXTaTvfPM=;
        b=Nc5nRPnqaIshUDhKEuf0O6FgnuDmcjWd+vxiAnlVtgg8AzVzmg5YZdXa5p4pYFcHlV
         +KB436oOYx9t2DgYBbvcg+zROZwIVApzFgxEHt+sY4Yt3o/XiYhiPHh2hWcvoWXEkVKX
         p7rjxnlnGMWWb9J1fHrahYN8khzzbBB4NDkzvT3B9iyMHoMVi+VLlVy3UxeME/sKLqUd
         zKeAtIWmCm5tMndM631/IndFtcxtxdIGUdMvP9w38Nq104wJUJfE+3l32HHVs/bmMwLl
         Xs5kf1vk+bnoNXOf0Jeu4QBaNDQeTk/OPFnqyrRKvy34UE678renZjer0xs4ecMbN87r
         hu+g==
X-Gm-Message-State: APjAAAVUwQ4f9p5idldVfPUNvnUEu9vMHYI0gzhomYIeG3e/NzMicUQH
        +L9X1AXO5L4rh60+89JcUkYoOH6NSCKrPf18+34KO+PrWz4=
X-Google-Smtp-Source: APXvYqyYnDUJ4gofow8dHWJBmlTpH77FUPxhfrmxEXuQFVDnJnY6C8oIhqrq59B6URfYdy2H0hUBsY3cZB3byOq0qBc=
X-Received: by 2002:a17:906:f0d6:: with SMTP id dk22mr46464835ejb.307.1582557811740;
 Mon, 24 Feb 2020 07:23:31 -0800 (PST)
MIME-Version: 1.0
References: <CADQNx5TaaJhCJMPQTtGrNibY082SmjVKa3EG9SDJPsteLnn41A@mail.gmail.com>
In-Reply-To: <CADQNx5TaaJhCJMPQTtGrNibY082SmjVKa3EG9SDJPsteLnn41A@mail.gmail.com>
From:   Andrij Abyzov <drolevar@gmail.com>
Date:   Mon, 24 Feb 2020 16:23:20 +0100
Message-ID: <CADQNx5T1Sq0=-8vJzkDta4FsYhRGgbZzLfd5pxiSY+XWhhaskQ@mail.gmail.com>
Subject: Re: Strange behavior in i2c-mpc
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

I=E2=80=99m trying to implement the following transfer with the i2c-mpc dri=
ver:

Read MR: Initiate pressure management

+---------------------+
|S|6|5|4|3|2|1|0|R|A|S|
+---------------------+

First S - start condition
6:0 - slave address
R - read bit ('1')
A - wait for slave ACK
Second S - stop condition.

My guess was that doing that would be enough:

    struct i2c_msg msg =3D {
        .addr =3D <addr>,
        .flags =3D I2C_M_RD,
        .len =3D 0,
        .buf =3D NULL,
    };

    return i2c_transfer(data->client->adapter, &msg, 1);

However, when the length parameter is 0, the wait for the CSR_MBB bit
in lines 617-630 of mpc_xfer in drivers/i2c/busses/i2c-mpc.c times
out.

I=E2=80=99m checking the NXP P2020 spec, and it says that

     Note that a master can generate a STOP even if the slave has transmitt=
ed an
     acknowledge bit, at which point the slave must release the bus.

To me everything seems OK here, but still CSR_MBB never becomes zero.
Would you be able to give me any advice?

Best regards,
Andrij Abyzov
