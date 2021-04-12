Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8736F35C0F0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 11:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbhDLJSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 05:18:13 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59448 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239024AbhDLJMj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 05:12:39 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13C9BJKG123315;
        Mon, 12 Apr 2021 09:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=nbrMDN3r/gmkDt/OOiRBzu4eDv1M/6rOyOwm3hSUUfY=;
 b=sFcUw/8ZGohmnbWBp4cvM0MAznOt7gi4zBk+F3bUEiAQ3zgD/UHvNyNKUr04OInjPg8J
 7uCophsIQMwkHKu5tDLb49oSS4oBZy2CPV6eFB1jW1k0kRN4VgvikGw7j1O0QfbelKwE
 +W2l7ZXqNdLSTKiHP+tJNDjAklCji8kkXStW9cKj3q+l46YS2elA782vcKf0zuDZZHgu
 TyRXbYNH7+6P1kcyjrZ3gNTEUPyPKN58WIM4bK7gsTgdJSlPRSP7dX22lAIPBWyiQ+mU
 wuaEh3ICCP+3Mv0Ahff8hT5c6wXrzWcuSYw26Nv25vL/22xV7T8Cg8CUFD7fu16w2nUi aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 37u3ymaxg8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 09:12:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13C99anN122075;
        Mon, 12 Apr 2021 09:12:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 37unwx3dww-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 09:12:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13C9BweC031359;
        Mon, 12 Apr 2021 09:11:58 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 12 Apr 2021 02:11:57 -0700
Date:   Mon, 12 Apr 2021 12:11:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210412091151.GV6048@kadam>
References: <YHBJRvcOSaM/b0RL@mwanda>
 <20210410122729.GA6136@michael-VirtualBox>
 <20210410153712.GQ6048@kadam>
 <20210410210425.GA4073@michael-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410210425.GA4073@michael-VirtualBox>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9951 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120061
X-Proofpoint-GUID: DuN6qnFhiNejlye4IJG2eFkmPgql03eb
X-Proofpoint-ORIG-GUID: DuN6qnFhiNejlye4IJG2eFkmPgql03eb
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9951 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120061
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 11, 2021 at 12:04:25AM +0300, Michael Zaidman wrote:
> On Sat, Apr 10, 2021 at 06:37:13PM +0300, Dan Carpenter wrote:
> > On Sat, Apr 10, 2021 at 03:27:29PM +0300, Michael Zaidman wrote:
> > > On Fri, Apr 09, 2021 at 03:32:06PM +0300, Dan Carpenter wrote:
> > > > Hello Michael Zaidman,
> > > > 
> > > > The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
> > > > driver" from Feb 19, 2021, leads to the following static checker
> > > > warning:
> > > > 
> > > > 	drivers/hid/hid-ft260.c:441 ft260_smbus_write()
> > > > 	error: '__memcpy()' '&rep->data[1]' too small (59 vs 255)
> > > > 
> > > > drivers/hid/hid-ft260.c
> > > >    423  static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
> > > >    424                               u8 *data, u8 data_len, u8 flag)
> > > >    425  {
> > > >    426          int ret = 0;
> > > >    427          int len = 4;
> > > >    428  
> > > >    429          struct ft260_i2c_write_request_report *rep =
> > > >    430                  (struct ft260_i2c_write_request_report *)dev->write_buf;
> > > >    431  
> > > >    432          rep->address = addr;
> > > >    433          rep->data[0] = cmd;
> > > >    434          rep->length = data_len + 1;
> > > >    435          rep->flag = flag;
> > > >    436          len += rep->length;
> > > >    437  
> > > >    438          rep->report = FT260_I2C_DATA_REPORT_ID(len);
> > > >    439  
> > > >    440          if (data_len > 0)
> > > >    441                  memcpy(&rep->data[1], data, data_len);
> > > >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > Smatch says that this can be called from the i2cdev_ioctl_smbus()
> > > > function.
> > > 
> > > Hi Dan,
> > > 
> > > This is an example of a false-positive static checker warning.
> > > 
> > > The maximum data size that the i2cdev_ioctl_smbus() can pass to the
> > > i2c_smbus_xfer() is sizeof(data->block) which is (I2C_SMBUS_BLOCK_MAX + 2)
> > > or 34 bytes. Thus, no need to check the data_len against 59 here.
> > > 
> > > > 
> > > > i2cdev_ioctl_smbus()
> > > >   --> i2c_smbus_xfer
> > > >       --> __i2c_smbus_xfer
> > > >           --> ft260_smbus_xfer
> > > >               --> ft260_smbus_write
> > 
> > It's actually me who misunderstood the Smatch warning.  Smatch is not
> > complaining about data_len, it's data->block[0] which is user
> > controlled and only for the I2C_SMBUS_I2C_BLOCK_DATA command.
> > 
> > The call tree is the same.  I've looked at it again.  Here is how
> > i2cdev_ioctl_smbus() looks like:
> > 
> > drivers/i2c/i2c-dev.c
> >    355                  return -EINVAL;
> >    356          }
> >    357  
> >    358          if ((size == I2C_SMBUS_BYTE_DATA) ||
> >    359              (size == I2C_SMBUS_BYTE))
> >    360                  datasize = sizeof(data->byte);
> >    361          else if ((size == I2C_SMBUS_WORD_DATA) ||
> >    362                   (size == I2C_SMBUS_PROC_CALL))
> >    363                  datasize = sizeof(data->word);
> >    364          else /* size == smbus block, i2c block, or block proc. call */
> >    365                  datasize = sizeof(data->block);
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> >    366  
> >    367          if ((size == I2C_SMBUS_PROC_CALL) ||
> >    368              (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
> >    369              (size == I2C_SMBUS_I2C_BLOCK_DATA) ||
> >                              ^^^^^^^^^^^^^^^^^^^^^^^^
> >    370              (read_write == I2C_SMBUS_WRITE)) {
> >    371                  if (copy_from_user(&temp, data, datasize))
> >                                             ^^^^
> > temp.block[0] is user controlled.
> > 
> >    372                          return -EFAULT;
> >    373          }
> >    374          if (size == I2C_SMBUS_I2C_BLOCK_BROKEN) {
> >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> >    375                  /* Convert old I2C block commands to the new
> >    376                     convention. This preserves binary compatibility. */
> >    377                  size = I2C_SMBUS_I2C_BLOCK_DATA;
> >    378                  if (read_write == I2C_SMBUS_READ)
> >    379                          temp.block[0] = I2C_SMBUS_BLOCK_MAX;
> >                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Except for size BROKEN
> > 
> >    380          }
> >    381          res = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
> >    382                read_write, command, size, &temp);
> >                                                  ^^^^^
> > 
> >    383          if (!res && ((size == I2C_SMBUS_PROC_CALL) ||
> >    384                       (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
> >    385                       (read_write == I2C_SMBUS_READ))) {
> >    386                  if (copy_to_user(data, &temp, datasize))
> >    387                          return -EFAULT;
> >    388          }
> > 
> > The rest of the call tree seems straight forward but it's possible I
> > have missed somewhere that checks data[0].  Here is how ft260_smbus_xfer()
> > looks like.
> 
> Oh, you are right. Despite that the SMbus block transaction limits the maximum
> number of bytes to 32, nothing prevents a user from specifying via ioctl a larger
> data size than the ft260 can handle in a single transfer.
> 
> I am going to fix it in the ft260_smbus_write (with your Signed-off-by), but
> perhaps we should fix it in the first place, in the i2cdev_ioctl_smbus routine?
> What do you think?

Could you just give me a Reported-by tag?  Thanks!

regards,
dan carpenter


