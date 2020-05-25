Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1554D1E0EA5
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 14:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390615AbgEYMn6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 08:43:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51475 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390608AbgEYMn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 May 2020 08:43:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200525124356euoutp012d4a1cd9bc558d78d02a7cffdde40759~SRgw-UvHG0300003000euoutp01v
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 12:43:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200525124356euoutp012d4a1cd9bc558d78d02a7cffdde40759~SRgw-UvHG0300003000euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590410636;
        bh=WSbY84KbUGFbLyo6SUqTrYaZH9Ab/qZiVUsKoLI42iw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=nU79SSkESRoSeFaLsdTqupsE9qSA1wJhg2vElk9ARFXXq2/JGPWtc9+pgKQYb6hsA
         50WJlf35pMJNO0+Sz6Igorq7izAUsb16oEz/rAcI6gmPfQw/zGxKowNn8b7UAZRQfR
         Q3ozL8bnCUhOBR6Bm3z4mYBIC3bGz0iCtfbsb2gk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200525124356eucas1p1d14dd0b7bf2919bdbe1f1bef094c0634~SRgwvW9Yk1354113541eucas1p10;
        Mon, 25 May 2020 12:43:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B4.CC.61286.C8DBBCE5; Mon, 25
        May 2020 13:43:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200525124355eucas1p28f232f83f79fee234635a64270e4dd32~SRgwFl-M92127721277eucas1p2J;
        Mon, 25 May 2020 12:43:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200525124355eusmtrp27a65ce5361bfea56fc7aeda010be4b81~SRgwE6aPp0100701007eusmtrp2j;
        Mon, 25 May 2020 12:43:55 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-41-5ecbbd8cbbf3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.43.08375.B8DBBCE5; Mon, 25
        May 2020 13:43:55 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200525124355eusmtip2f220baba69d595fe546ae2255a0cf363~SRgvfJiAM0854808548eusmtip2D;
        Mon, 25 May 2020 12:43:55 +0000 (GMT)
Subject: Re: [PATCH] i2c: core: fix NULL pointer dereference in
 suspend/resume callbacks
To:     Tomasz Figa <tfiga@chromium.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <77f41c67-cd6f-59c5-15b4-c7d8756ca28a@samsung.com>
Date:   Mon, 25 May 2020 14:43:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djP87o9e0/HGew4Km2xccZ6Vosvc0+x
        WMzcMIPFouPvF0aLy7vmsFl87j3CaDHj/D4mi+l3hSw+t/5js1h5YhazA5fH+xut7B6zGy6y
        eLSc3M/i0bdlFaPHyVNPWDw+b5ILYIvisklJzcksSy3St0vgyphzaCFLwQmuil2HZrA1MJ7n
        6GLk5JAQMJHofzWfrYuRi0NIYAWjxLx9JxkhnC+MEhtXtLBCOJ8ZJQ43TAZyOMBaZnXlQMSX
        M0r8PHufHcJ5zyjx/Pk3NpAiYYEoiSMf+UBWiAj4SPyf2AA2lVmgiVni2s0XTCAJNgFDia63
        XWwgNq+AncTH60uZQWwWAVWJBbMXgdmiArESpxdvZoSoEZQ4OfMJC4jNKRAo8ezdMbAaZgF5
        ie1v50DZ4hK3nsxnAlkmIXCOXeLV/gcsEI+6SJx+/IMJwhaWeHV8CzuELSPxfydMQzOjxMNz
        a9khnB5GictNMxghqqwl7pz7BfYas4CmxPpd+hBhR4lNf68wQ4KFT+LGW0GII/gkJm2bDhXm
        lehoE4KoVpOYdXwd3NqDFy4xT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNsxLLdcr
        TswtLs1L10vOz93ECExVp/8d/7SD8eulpEOMAhyMSjy8FmtOxwmxJpYVV+YeYpTgYFYS4W1z
        BwrxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAuG15bZfZ
        HL3lrx/mT018MSVK2dFvQzf7iaWt8TdbFOQWiJQ6xV1nd+vcVrSjMidSereW7QXutru2hjY8
        cmmCuoLr4pVWHOf567g+2GvPsy8/52yY9UvA80NduPrlI9tkv7lum6RT0c6UsJL714q9Lq1T
        n54rL41cnf5mEaN8xsJKm4WGtlOjlViKMxINtZiLihMBFpiN7VEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7rde0/HGfxZpmexccZ6Vosvc0+x
        WMzcMIPFouPvF0aLy7vmsFl87j3CaDHj/D4mi+l3hSw+t/5js1h5YhazA5fH+xut7B6zGy6y
        eLSc3M/i0bdlFaPHyVNPWDw+b5ILYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
        tTIyVdK3s0lJzcksSy3St0vQy5hzaCFLwQmuil2HZrA1MJ7n6GLk4JAQMJGY1ZXTxcjFISSw
        lFFi+5sPbF2MnEBxGYmT0xpYIWxhiT/Xutggit4ySsyY0cYCkhAWiJKYfuAAO4gtIuAj8X9i
        AyNIEbNAC7PEqTcrmCA6epkkLuyZDdbBJmAo0fW2C2wFr4CdxMfrS5lBbBYBVYkFsxeB2aIC
        sRKrr7UyQtQISpyc+QSsl1MgUOLZu2NgNcwCZhLzNj+EsuUltr+dA2WLS9x6Mp9pAqPQLCTt
        s5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB0bnt2M/NOxgvbQw+xCjA
        wajEw2ux5nScEGtiWXFl7iFGCQ5mJRHeNnegEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucD
        E0deSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGmozVvptYUpQS
        8vY9Mjp+qW+/5ImiRZ4izufSygILmFQ2ZC5jseXTkZ1+Xu7V6d3beD7XTjUTWFMhd6nOVUHn
        zu/UngqZxz23nwi93ms3wdVALHvfquu2P3JFYx1fy015KTX5tajSpPzWbyLfS25XxlwVP7Y+
        v0v6zZaIjd+3fz4+zdPKX5FDiaU4I9FQi7moOBEAlwxD7eQCAAA=
X-CMS-MailID: 20200525124355eucas1p28f232f83f79fee234635a64270e4dd32
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
        <20200522101327.13456-1-m.szyprowski@samsung.com>
        <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
        <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomasz

On 25.05.2020 14:28, Tomasz Figa wrote:
> On Fri, May 22, 2020 at 1:15 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 22.05.2020 12:13, Marek Szyprowski wrote:
>>> Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
>>> adapter") added generic suspend and resume functions for i2c devices.
>>> Those functions unconditionally access an i2c_client structure assigned
>>> to the given i2c device. However, there exist i2c devices in the system
>>> without a valid i2c_client. Add the needed check before accessing the
>>> i2c_client.
>> Just one more comment. The devices without i2c_client structure are the
>> i2c 'devices' associated with the respective i2c bus. They are visible
>> in /sys:
>>
>> ls -l /sys/bus/i2c/devices/i2c-*
>>
>> I wonder if this patch has been ever tested with system suspend/resume,
>> as those devices are always available in the system...
> Sorry for the trouble and thanks a lot for the fix. We'll make sure to
> do more thorough testing, including suspend/resume before relanding
> this change.
>
> Since the patch was reverted, can we squash your fix with the next
> revision together with your Co-developed-by and Signed-off-by tags?
Sure, no problem. The fix is trivial.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

